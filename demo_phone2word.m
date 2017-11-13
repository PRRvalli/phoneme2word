%list=dir('/home/parallellab2/project/Phone_word/Gaurav_processed/Gaurav_results/*.txt');
list=dir('results/*.txt');
%list1=dir('/home/srinivasa/Phone_word/anisha_processed/anisha_results/');
%list2=dir('/home/srinivasa/Phone_word/anisha_processed/anisha_word_final_results/');

% phoneme_file
for i=1:length(list)
    file_1=[list(i).name];
    %file_2=[list(i).name(1:3),'_init.txt'];
    file_2=[list(i).name(1:3)];
    file_3=['Words_',list(i).name(1:3),'.txt'];
    path_1=['./results/',file_1];    
    path_2=['./transcript/',file_2];
    out_file=['./word_final_results/',file_3];
    phone2word(path_2,path_1,out_file);
end
