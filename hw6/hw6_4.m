subplot(3,1,1)
harris_match('house1.jpg', 'house2.jpg');
subplot(3,1,2)
harris_match('house1.jpg', 'house1-rotated.jpg');
subplot(3,1,3)
harris_match('house1-4down.jpg', 'house2.jpg');