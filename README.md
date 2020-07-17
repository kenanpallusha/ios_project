# ios_project

Ky eshte nje aplikacion per te ruajtur shenimet (Notes). 
Aplikacioni ofron keto mundesi:

* Krijimi i Profilit
* Editimi i Profilit
* Krijimi i nje Shenimi te ri
* Editimi i Shenimeve
* Fshirja e Shenimeve
* Ndarja sipas kategorive te Shenimeve

Gjate krijimit te aplikacionit jane perdorur 5 View: Create Profile, All Notes, Create Note, Menu, Select Category. Ku Menu dhe Select Category jane Modal Views te cilat paraqiten mbi View te tjera. Aplikacioni permban navigim dhe permes navigacionit mund te kaloj nga nje view ne tjetren (Segue). Aplikacioni permban 2 tabela njera per paraqitjen e te gjitha Shenimeve kurse tjetra per paraqitjen e te gjitha kategorive. Te dhenat e Userit ruhen si objekt i klases UserProfileModel ne NSUserDefaults, kurse te dhenat per shtimin fshirjen dhe editimin e Shenimeve ruhen ne databazen lokale ku si databaze lokale jane perdorur Core Data.
