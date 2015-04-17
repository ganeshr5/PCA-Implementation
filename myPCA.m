function myPCA(filename, num_components)

% checking whether the input filename is correct
if (strcmp(filename,'Digits.mat'))
    % load the required mat file
    load Digits_HW3.mat;
else
    disp('wrong filename');
end

% concatenate both the train and test dataset
data = cat(1,train(:,1:64),test(:,1:64));
labels = cat(1,train(:,65),test(:,65));

% compute mean of each feature vector/column
for i=1:64
    meanData(1,i) = mean(data(:,i));
end

% subtract the mean
for i=1:64
    data(:,i) = data(:,i) - meanData(1,i);
end

A = data'*data;
[V, D] = eig(A);

% sorting in descending order of eigen values
[D,I] = sort(diag(D),'descend');
D = diag(D);
V = V(:, I);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Q1 (a)
if (num_components==2)
    project2D = (V(:,1:2)')*data';
    gscatter(project2D(1,:),project2D(2,:),labels');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Q1 (b)
if (num_components==3)
    project3D = (V(:,1:3)')*data';
    scatter3(project3D(1,:),project3D(2,:),project3D(3,:),36,labels');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
