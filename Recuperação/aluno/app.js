const reviews = [
  {
      name:"Pedro Artur Rolemberg",
      job:"Junior Web Developer",
      image:"https://media.licdn.com/dms/image/C4D03AQGRS_LINXnrrw/profile-displayphoto-shrink_200_200/0/1660011565511?e=1705536000&v=beta&t=_CeYQyt8o9Ft6T3jPLTjmfeJJAt7ae5tkQqQtziylJ0",
      text: "Meu nome é Pedro Artur Rolemberg, sou um desenvolvedor iniciante de 18 anos estudante de segurança da informação e redes, nascido em Maceió, estou interessado em cargos que possam evoluir tanto a mim como profissional quanto a instituição em que eu venha a trabalhar dentro de seu âmbito de atuação, acredito plenamente que um bom trabalho em um mínimo detalhe pode realizar a maior das diferenças.",
  },
  {
      name:"Carlos Vasconcelos",
      job:"Instrutor de Tecnologida de Informação | Web Developer",
      image:"https://media.licdn.com/dms/image/C4D03AQE7Zl2vAsGnaQ/profile-displayphoto-shrink_400_400/0/1634128321167?e=1705536000&v=beta&t=oKKO7KgHYT1ahIDsMfaAhKcmdrbPOtUFqGxZizWKa0s",
      text: "Aniquilador de bizonhos",
  },
  {
      name:"Leticia Dias",
      job:"Instrutora de Informática at SENAI Alagoas ",
      image:"https://media.licdn.com/dms/image/D4D03AQFvNmfchAHCKw/profile-displayphoto-shrink_200_200/0/1696466585207?e=1705536000&v=beta&t=jjATxVVwwwPIs3EnPPfo93ypgKBGXwRcT2ik7sxveUQ",
      text: "Faço parte do Space Squad(uma comunidade criada pela Rocketseat) como embaixadora, onde também sou co-host do podcast Space Cast. Também sou criadora de conteúdo sobre tecnologia e co-fundadora do blog Techknowledge. ",
  },
  {
      name:"Bruno Matheus",
      job:"Instrutor de TI | Analista de CyberSecurity (SOC) ",
      image:"https://media.licdn.com/dms/image/C4D03AQHqrHBWD4HrFg/profile-displayphoto-shrink_200_200/0/1650894617475?e=1705536000&v=beta&t=R-i2etOq35dWL7Vj9oxvfEFsR7z_VUZ_Ep47nqiw8q8",
      text: "Graduando Ciências da Computação, Pós-graduado em Engenharia de Software e extremamente apaixonado pela tecnologia. Busco compreender cada dia mais os impactos que a segurança da informação pode proporcionar ao mundo. ",
  },
];

let i = 0

function ToRight(){
  i++
  if(i==4){
      i=0
      ToRight(i)
  }
  document.getElementById("author").innerHTML = reviews[i].name
  document.getElementById("job").innerHTML = reviews[i].job
  document.getElementById("text").innerHTML = reviews[i].text
  document.getElementById("img").setAttribute("src", reviews[i].image)
}

function ToLeft(){
  i--
  if(i==4){
      i=0
      ToLeft(i)
  }
  document.getElementById("author").innerHTML = reviews[i].name
  document.getElementById("job").innerHTML = reviews[i].job
  document.getElementById("text").innerHTML = reviews[i].text
  document.getElementById("img").setAttribute("src", reviews[i].image)
}
