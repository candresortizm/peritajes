SuperUser.create(email: 'super@admin.com', password: 'password', password_confirmation: 'password',type: 'SuperUser')

Brand.create(name: 'AutoLab', address: 'Av. NQS # 70 - 16', telephone: '7429249',nit: '123456456')

BrandAdmin.create(email: 'admin@autolab.com', password: 'password', password_confirmation: 'password',type: 'BrandAdmin',brand_id:1)

QuestionCategory.create(name:"Motor",order:1)
QuestionCategory.create(name:"Interior",order:2)
QuestionCategory.create(name:"Exterior",order:3)
QuestionCategory.create(name:"Parte baja",order:4)
QuestionCategory.create(name:"Alineación y llantas",order:5)
QuestionCategory.create(name:"Accesorios",order:6)