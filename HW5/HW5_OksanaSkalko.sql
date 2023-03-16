-- Task 1
'country - primary key: country_id, foreign key: - '
'city - primary key: city_id, foreign key: country_id, relation: one-to-many (one country has many cities)'
'film - primary key: film_id, foreign key: [language_id, original_language_id], relation: [language_id => one-to-one, original_language_id => one-to-one]'
'film_category - primary key: [film_id, category_id], foreign key: [film_id, category_id], relation: one-to-many (one category has many films)'

-- Task 2
'db wallpaper'
'База даних завода з виробництва шпалер. В таблиці article містяться дані - id, назва моделі шпалер, id матеріалу та id кольору.'
'Таблиця color містить id і назву кольору, таблиця material містить id і назву матеріалу'
'Таблиця article має звязок один-до-багатьох із таблицями color i material (один article може мати лише один color i один material, але один color може належати різним article і один material може належати різним article)'
'Таблиця customer містить інформацію про замовників - id, імя, прізвище, телефон та адресу'
'Таблиця production_line містить інформацію про лінії виробництва, на яких завод може виготовляти свою продукцію - id, назву лінії (наприклад спец заводський номер) та локацію де вона знаходиться (наприклад номер цеха)'
'Таблиця order містить інформацію про замовлення - id, id замовника, id лінії на якій буде виготовлятись замовлення та дату замовлення'
'Order має звязок із таблицею production_line один-до-багатьох (на одній лінії можна виконати багато різних замовлень, але кожне замовлення виготовляється лише на одній лінії)'
'Order має звязок із таблицею customer багато-до-одного (замовник може зробити багато замовлень, але кожне замовлення має лише одного замовника'
'Article i order мають звязок багато-до-багатьох через таблицю order_article (кожне замовлення може містити набір товарів і кожен товар може бути у різних замовленнях)'