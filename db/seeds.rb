Make.create(name: "Proton")
Make.create(name: "Produa")

Model.create(name: "Wira", make_id: Make.find_by(name: "Proton").id)
Model.create(name: "Satria", make_id: Make.find_by(name: "Proton").id)
Model.create(name: "Saga", make_id: Make.find_by(name: "Proton").id)
Model.create(name: "Myvi", make_id: Make.find_by(name: "Produa").id)
Model.create(name: "Alza", make_id: Make.find_by(name: "Produa").id)
Model.create(name: "Axia", make_id: Make.find_by(name: "Produa").id)
