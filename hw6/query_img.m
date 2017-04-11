function detected = query_img(q, db)

im_q = imread(q);

for i = 1:size(db)
im_db = imread(db(i));

end
