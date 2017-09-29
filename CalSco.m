function CalSco(Path, Filename)
[~, ~,Data] = xlsread([Path, Filename]);

MappingChar = {'��','��','��','����','������'};
MappingScore = [95, 85, 75, 60, 0];
[Score, Credit] = deal([]);
[Index, ~]=find(strcmp(Data,'ѧ��'));
Number = length(Index);
Output = cell(Number, 6);% Name, gender, SN, major, Teacher, Score
for i = 1:Number
    index = Index(i);
    Output{i, 1} = Data{index + 0, 4};
    Output{i, 2} = Data{index + 0, 6};
    Output{i, 3} = Data{index + 0, 2};
    Output{i, 4} = Data{index + 1, 3};
    Output{i, 5} = Data{index + 1, 8};
    j = index + 4;
    while ~strcmp(Data{j, 1}, '��ѧ��(����ѧλ����)')
        if Data{j, 6} == '/'
            Score = [Score, str2num(Data{j, 5})];
            Credit = [Credit, Data{j, 7}*0.65];
        elseif ~isnan(Data{j, 6})
                [~, Map] = find(strcmp(MappingChar, Data{j, 6}));
                Score = [Score, MappingScore(Map)];
                Credit = [Credit, Data{j, 7}*0.35];
        end
        j = j + 1;        
    end
    Output{i, 6} = round(Score*Credit' / sum(Credit), 2);
    Score = []; Credit = [];
end
if exist([Path, 'Result.xls'],'file')
    delete([Path, 'Result.xls']);
end
xlswrite([Path, 'Result.xls'], Output);
end