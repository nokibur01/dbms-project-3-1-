USE social_media_mini;

-- ============================================
-- ADMINS
-- ============================================
INSERT INTO ADMINS (username, email, password) VALUES
('admin', 'admin@socialmedia.com', 'admin123');

-- ============================================
-- USERS (password is 1234 for all)
-- ============================================
INSERT INTO USERS (username, email, password, full_name, dob, gender, phone, city, bio, profile_pic) VALUES
('rafi_ahmed',     'rafi@email.com',     '1234', 'Rafi Ahmed',       '2000-03-15', 'male',   '01711111111', 'Dhaka',      'Photography lover',          'https://api.dicebear.com/7.x/adventurer/svg?seed=rafi'),
('priya_khan',     'priya@email.com',    '1234', 'Priya Khan',       '2001-07-22', 'female', '01722222222', 'Chittagong', 'Travel and food enthusiast', 'https://api.dicebear.com/7.x/adventurer/svg?seed=priya'),
('nabil_hasan',    'nabil@email.com',    '1234', 'Nabil Hasan',      '1999-11-05', 'male',   '01733333333', 'Sylhet',     'Coder by day gamer by night','https://api.dicebear.com/7.x/adventurer/svg?seed=nabil'),
('tania_akter',    'tania@email.com',    '1234', 'Tania Akter',      '2002-01-30', 'female', '01744444444', 'Rajshahi',   'Books and coffee',           'https://api.dicebear.com/7.x/adventurer/svg?seed=tania'),
('farhan_islam',   'farhan@email.com',   '1234', 'Farhan Islam',     '1998-09-18', 'male',   '01755555555', 'Dhaka',      'Football fan',               'https://api.dicebear.com/7.x/adventurer/svg?seed=farhan'),
('sadia_rahman',   'sadia@email.com',    '1234', 'Sadia Rahman',     '2000-05-12', 'female', '01766666666', 'Khulna',     'Artist and designer',        'https://api.dicebear.com/7.x/adventurer/svg?seed=sadia'),
('imran_chow',     'imran@email.com',    '1234', 'Imran Chowdhury',  '1997-12-25', 'male',   '01777777777', 'Comilla',    'Music is life',              'https://api.dicebear.com/7.x/adventurer/svg?seed=imran'),
('nusrat_jahan',   'nusrat@email.com',   '1234', 'Nusrat Jahan',     '2001-08-14', 'female', '01788888888', 'Dhaka',      'Foodie and baker',           'https://api.dicebear.com/7.x/adventurer/svg?seed=nusrat'),
('sakib_hossain',  'sakib@email.com',    '1234', 'Sakib Hossain',    '1999-04-20', 'male',   '01799999999', 'Dhaka',      'Cricket enthusiast',         'https://api.dicebear.com/7.x/adventurer/svg?seed=sakib'),
('mitu_begum',     'mitu@email.com',     '1234', 'Mitu Begum',       '2002-06-11', 'female', '01811111111', 'Mymensingh', 'Nature lover',               'https://api.dicebear.com/7.x/adventurer/svg?seed=mitu'),
('arif_billah',    'arif@email.com',     '1234', 'Arif Billah',      '1998-02-28', 'male',   '01822222222', 'Dhaka',      'Entrepreneur',               'https://api.dicebear.com/7.x/adventurer/svg?seed=arif'),
('roksana_parvin', 'roksana@email.com',  '1234', 'Roksana Parvin',   '2000-10-17', 'female', '01833333333', 'Sylhet',     'Fashion and lifestyle',      'https://api.dicebear.com/7.x/adventurer/svg?seed=roksana'),
('tanvir_ahmed',   'tanvir@email.com',   '1234', 'Tanvir Ahmed',     '1997-07-03', 'male',   '01844444444', 'Chittagong', 'Tech geek',                  'https://api.dicebear.com/7.x/adventurer/svg?seed=tanvir'),
('sumaiya_islam',  'sumaiya@email.com',  '1234', 'Sumaiya Islam',    '2001-03-25', 'female', '01855555555', 'Dhaka',      'Yoga and wellness',          'https://api.dicebear.com/7.x/adventurer/svg?seed=sumaiya'),
('mahfuz_alam',    'mahfuz@email.com',   '1234', 'Mahfuz Alam',      '1999-08-09', 'male',   '01866666666', 'Rajshahi',   'Poet and writer',            'https://api.dicebear.com/7.x/adventurer/svg?seed=mahfuz'),
('nasrin_sultana', 'nasrin@email.com',   '1234', 'Nasrin Sultana',   '2000-12-01', 'female', '01877777777', 'Khulna',     'Teacher and mentor',         'https://api.dicebear.com/7.x/adventurer/svg?seed=nasrin'),
('jubayer_hasan',  'jubayer@email.com',  '1234', 'Jubayer Hasan',    '1998-05-14', 'male',   '01888888888', 'Dhaka',      'Fitness freak',              'https://api.dicebear.com/7.x/adventurer/svg?seed=jubayer'),
('fariha_noor',    'fariha@email.com',   '1234', 'Fariha Noor',      '2002-09-30', 'female', '01899999999', 'Comilla',    'DIY crafts and art',         'https://api.dicebear.com/7.x/adventurer/svg?seed=fariha'),
('ashraf_uddin',   'ashraf@email.com',   '1234', 'Ashraf Uddin',     '1997-01-22', 'male',   '01911111111', 'Sylhet',     'Traveler and explorer',      'https://api.dicebear.com/7.x/adventurer/svg?seed=ashraf'),
('shirin_akter',   'shirin@email.com',   '1234', 'Shirin Akter',     '2001-11-08', 'female', '01922222222', 'Dhaka',      'Coffee addict',              'https://api.dicebear.com/7.x/adventurer/svg?seed=shirin');

-- ============================================
-- POSTS
-- ============================================
INSERT INTO POSTS (user_id, content, image_url) VALUES
(1,  'The sunset today was absolutely stunning. Dhaka never disappoints.',            'https://picsum.photos/seed/dhaka1/600/400'),
(2,  'Tried fresh hilsa fish in Chittagong today. Nothing beats it.',                'https://picsum.photos/seed/food1/600/400'),
(3,  'Just finished my first React project. Took three weeks but worth it.',         ''),
(4,  'Currently reading a Humayun Ahmed novel. Cannot put it down.',                 'https://picsum.photos/seed/book1/600/400'),
(5,  'Bangladesh won the match today. What a performance by the Tigers.',            'https://picsum.photos/seed/cricket1/600/400'),
(6,  'Finished a new painting this afternoon. Feeling really satisfied.',            'https://picsum.photos/seed/art1/600/400'),
(7,  'Went to a live concert last night. The energy was unreal.',                    'https://picsum.photos/seed/concert1/600/400'),
(8,  'Baked a chocolate cake for the first time. Turned out better than expected.',  'https://picsum.photos/seed/cake1/600/400'),
(9,  'Woke up at 6am for cricket practice. Hard work pays off.',                     ''),
(10, 'Went for a nature walk in the rain today. Very peaceful.',                     'https://picsum.photos/seed/nature1/600/400'),
(11, 'Working on a new business idea. Things are starting to come together.',        ''),
(12, 'Got a new dress from Bashundhara City. Love the style.',                       'https://picsum.photos/seed/fashion1/600/400'),
(13, 'Deployed my first app to the cloud today. Big milestone for me.',              ''),
(14, 'Morning yoga session at sunrise. Best way to start the day.',                  'https://picsum.photos/seed/yoga1/600/400'),
(15, 'Wrote a new poem today. It has been a while since I wrote one.',               ''),
(16, 'Spent the day teaching kids how to code. Very rewarding experience.',          'https://picsum.photos/seed/teach1/600/400'),
(17, 'Hit a new personal record at the gym today. 100kg bench press.',              'https://picsum.photos/seed/gym1/600/400'),
(18, 'Made handmade greeting cards today. Really enjoyed the process.',              'https://picsum.photos/seed/craft1/600/400'),
(19, 'Just got back from Cox Bazar. One of the best trips I have had.',              'https://picsum.photos/seed/beach1/600/400'),
(20, 'Rainy day with coffee and a good book. Perfect combination.',                  'https://picsum.photos/seed/coffee1/600/400');

-- ============================================
-- FOLLOWS
-- ============================================
INSERT INTO FOLLOWS (follower_id, following_id) VALUES
(1,2),(1,3),(1,5),(1,9),(1,11),
(2,1),(2,4),(2,6),(2,10),(2,12),
(3,1),(3,5),(3,7),(3,13),(3,11),
(4,2),(4,6),(4,8),(4,14),(4,15),
(5,1),(5,3),(5,7),(5,9),(5,17),
(6,2),(6,4),(6,8),(6,10),(6,18),
(7,3),(7,5),(7,9),(7,11),(7,14),
(8,4),(8,6),(8,10),(8,12),(8,20),
(9,1),(9,5),(9,11),(9,13),(9,17),
(10,2),(10,6),(10,12),(10,14),(10,4),
(11,1),(11,3),(11,9),(11,13),(11,5),
(12,2),(12,4),(12,6),(12,14),(12,16),
(13,3),(13,7),(13,11),(13,15),(13,1),
(14,4),(14,8),(14,12),(14,16),(14,6),
(15,5),(15,9),(15,13),(15,17),(15,4),
(16,6),(16,10),(16,14),(16,18),(16,15),
(17,7),(17,11),(17,15),(17,19),(17,9),
(18,8),(18,12),(18,16),(18,20),(18,6),
(19,9),(19,13),(19,17),(19,1),(19,2),
(20,10),(20,14),(20,18),(20,4),(20,15);

-- ============================================
-- LIKES
-- ============================================
INSERT INTO LIKES (user_id, post_id) VALUES
(2,1),(3,1),(5,1),(9,1),(11,1),
(1,2),(4,2),(6,2),(10,2),(12,2),
(1,3),(2,3),(7,3),(13,3),(14,3),
(3,4),(5,4),(8,4),(15,4),(20,4),
(1,5),(2,5),(6,5),(9,5),(16,5),
(3,6),(7,6),(8,6),(18,6),(19,6),
(1,7),(4,7),(5,7),(17,7),(20,7),
(2,8),(3,8),(6,8),(15,8),(18,8),
(1,9),(5,9),(7,9),(17,9),(13,9),
(2,10),(6,10),(8,10),(14,10),(20,10),
(1,11),(3,11),(9,11),(12,11),(15,11),
(2,12),(4,12),(6,12),(16,12),(18,12),
(3,13),(7,13),(11,13),(14,13),(19,13),
(4,14),(8,14),(12,14),(17,14),(20,14),
(5,15),(9,15),(13,15),(16,15),(18,15),
(6,16),(10,16),(14,16),(19,16),(20,16),
(7,17),(11,17),(15,17),(18,17),(20,17),
(8,18),(12,18),(16,18),(19,18),(20,18),
(9,19),(13,19),(17,19),(1,19),(4,19),
(10,20),(14,20),(18,20),(2,20),(6,20);

-- ============================================
-- COMMENTS
-- ============================================
INSERT INTO COMMENTS (post_id, user_id, text) VALUES
(1,  2,  'That looks absolutely stunning!'),
(1,  3,  'Dhaka sunsets are something else entirely.'),
(2,  1,  'Fresh hilsa is the best. I am jealous.'),
(2,  5,  'Need to plan a trip to Chittagong soon.'),
(3,  1,  'Great work Nabil. Keep building things.'),
(3,  13, 'React takes time but it is very rewarding.'),
(4,  6,  'Humayun Ahmed is one of the greatest writers.'),
(5,  1,  'The Tigers played brilliantly today.'),
(5,  9,  'What an incredible match that was.'),
(6,  4,  'Your paintings are always so impressive.'),
(7,  2,  'Which concert did you go to?'),
(8,  5,  'That cake looks delicious. Save me a slice.'),
(9,  5,  'Waking up that early takes serious dedication.'),
(10, 1,  'Rain walks are the most peaceful thing.'),
(11, 3,  'Would love to hear more about this idea.'),
(12, 14, 'Great choice. That style suits you.'),
(13, 3,  'Which platform did you deploy to?'),
(14, 17, 'Morning yoga is life changing.'),
(15, 4,  'Please share the poem when you can.'),
(16, 3,  'Teaching coding to kids is so rewarding.'),
(17, 9,  'That is a serious lift. Well done.'),
(18, 6,  'These look really beautiful and thoughtful.'),
(19, 2,  'Cox Bazar is always a good idea.'),
(20, 8,  'Rain and coffee is the perfect combination.');

-- ============================================
-- ALBUMS
-- ============================================
INSERT INTO ALBUMS (user_id, title, description) VALUES
(1,  'Dhaka Diaries',    'My favourite moments in Dhaka'),
(2,  'Travel Memories',  'Places I have visited around Bangladesh'),
(3,  'Coding Journey',   'My programming milestones and projects'),
(5,  'Cricket Moments',  'Best cricket memories'),
(6,  'Art Collection',   'My paintings and sketches'),
(9,  'Sports Life',      'Cricket and fitness moments'),
(15, 'Poetry and Words', 'My written works'),
(19, 'Cox Bazar Trip',   'Beach memories from the trip');

-- ============================================
-- ALBUM POSTS
-- ============================================
INSERT INTO ALBUM_POSTS (album_id, post_id) VALUES
(1,1),(1,10),
(2,2),(2,19),
(3,3),(3,13),
(4,5),(4,9),
(5,6),(5,12),
(6,9),(6,17),
(7,15),(7,4),
(8,19),(8,10);