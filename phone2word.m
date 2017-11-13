function phone2word(file_name,file_name_2,out_file)
    % file_name - transcript
    % file_name_2 - phoneme_list

    Text=importdata(file_name);
    Text=strsplit(Text{1},' ');
    fileID = fopen(file_name_2,'rb');
    words=importdata('word_list');
    phoneme=importdata('lexicon_with_blank');
    % sed 's/ //g' second > a
    list=importdata('lexicon');


    for i=1:length(list)
       spaces=strfind(phoneme{i},' ');
       words{i,2}=phoneme{i,1};
       words{i,3}=list{i};
       words{i,4}=length(spaces)+1;
    end   

    C = textscan(fileID,'%f %f %s');

    fclose(fileID);

    matrix={};
    full='';
    for i=1:length(C{1,1})
       matrix{i,1}=C{1,1}(i); 
       matrix{i,2}=C{1,2}(i);
       matrix{i,3}=C{1,3}(i);
       full=strcat(full,C{1,3}(i));
       full=strcat(full,'_');
    end
    phoneme_pos=strfind(full{1},'_');
    phoneme_pos=phoneme_pos+1;
    phoneme_pos=[1 phoneme_pos];


    current_pos=1;
    word_list={};
    for i=2:length(Text)
        if(~strcmp(Text{i},''))
        cell={};
        c=1;
        Index=[];
        min=1000;
        for j=1:length(words)
            if(strcmp(Text{i},words{j,1}))
            cell{c,1}=words{j,2};
            cell{c,1}=strrep(cell{c,1},' ','_');
            cell{c,2}=words{j,4};

            pos=strfind(full{1},cell{c,1});
            t=current_check(pos,current_pos);
            if(t>0)
                temp=find(phoneme_pos==t);
                if(temp<min)
                    min=temp;
                    Index(1)=temp;
                    Index(2)=cell{c,2};
                    Index(3)=c;
                    Index(4)=length(cell{c,1});
                    Index(5)=t;
                end
            end
            c=c+1;
            end
        end
        word_list{i-1,1}=matrix{Index(1),1};
        word_list{i-1,2}=matrix{Index(1)+Index(2)-1,2};
        word_list{i-1,3}=Text{i};

        current_pos=Index(5)+Index(4);
        end
    end
    final={};
    count=1;
    if(strcmp(matrix{1,3},'sil'))
    final{count,1}=matrix{1,1};
    final{count,2}=matrix{1,2};
    final{count,3}='sil';
    count=count+1;
    end
    for iter=1:length(word_list)-1
        if(word_list{iter,2}~=word_list{iter+1,1})
           % existence of silence 
           final{count,1}=word_list{iter,1};
           final{count,2}=word_list{iter,2};
           final{count,3}=word_list{iter,3};
           count=count+1;
           final{count,1}=word_list{iter,2};
           final{count,2}=word_list{iter+1,1};
           final{count,3}='sil';
           count=count+1;
        else
            final{count,1}=word_list{iter,1};
            final{count,2}=word_list{iter,2};
            final{count,3}=word_list{iter,3};
            count=count+1;
        end


    end
            final{count,1}=word_list{iter+1,1};
            final{count,2}=word_list{iter+1,2};
            final{count,3}=word_list{iter+1,3};
            count=count+1;
    if(strcmp(matrix{end,3},'sil'))
        final{count,1}=matrix{end,1};
        final{count,2}=matrix{end,2};
        final{count,3}='sil';
        count=count+1;
    end


    fileID_2 = fopen(out_file,'w');
    for i=1:length(final)
        x=final{i,1};
        y=final{i,2};
        z=final{i,3};
        fprintf(fileID_2,'%f\t%f\t%s\n',x,y,z);
    end
    fclose(fileID_2);






end
