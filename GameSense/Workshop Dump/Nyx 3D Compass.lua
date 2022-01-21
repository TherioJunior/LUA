require "gamesense/nyx"

local Callbacks = require "gamesense/Nyx/Callbacks"
local Client = require "gamesense/Nyx/Client"
local Color = require "gamesense/Nyx/Color"
local Data = require "gamesense/Nyx/Data"
local Entity = require "gamesense/Nyx/Entity"
local Math = require "gamesense/Nyx/Math"
local Menu = require "gamesense/Nyx/Menu"
local Nyx = require "gamesense/Nyx/Framework"
local Player = require "gamesense/Nyx/Player"
local Texture = require "gamesense/Nyx/Texture"
local Time = require "gamesense/Nyx/Time"
local Timer = require "gamesense/Nyx/Timer"
local VectorsAngles = require "gamesense/Nyx/VectorsAngles"
local Angle, Vector2, Vector3 = VectorsAngles.Angle, VectorsAngles.Vector2, VectorsAngles.Vector3

--region Hex
local markerGenericHex = "89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a8660000001974455874536f6674776172650041646f626520496d616765526561647971c9653c000011f94944415478daec9d8d55db4a1085b5aac0a920a2024c05980a422ac054005400ae00a820a682900a30150015a054103ae069609c671c1b4bb27e7676bf7b8e0f7979e7047977eedd3bb3b32b9700b3787d7d1d143f86fa9f23fdf9b5f864fae7c5ff5f178fc5e745ff9c179fdffae7d9fcff3be75e980d9b700c8109a20f95d4f27357893df2ec31672a144f2a1a79210c8fcc1e0200aa937da4441f36b082f78d47fd8830cc100504007c24fc4809bfefe1aadea65bb8574198110508408c2bfcb788085f46107ee110108050497fa82bfc61f27f810eac465e7c6ec521146270cb7020009649ff4d493f60446ae145c5e01762800058b1f72790be5531b8264d40007c22bd107dacc4c7de7797265c179f293d0808405fc41f153f8e94fca03f4c8bcf0dbb09084057c417c29fb3da7be90a2685104c190a04a00d9b7faa369fdcdeff5a81a40757a40708c0b6c4cf74b5a7a8675308c40d48d130673810803ac427bf0fa74e3041081080b256ff9cd1081213520304801c9fd4801a0102f097fce384aa7e8cc813760de21500eddabb4c3890133b66c5e72cd6eec23446bb5f7c84f80f901f680c3c484c682a88030898fcb29df7833c1f7c521f388ee9e0918b84f899129f151f944d0b8e63d8364c2320ff29761fd44c0b4e71008673fde2c74f880f1a7003df43dd324c0325bfe4facf901f34e4069e35a61000df577dadf0cbca4fa10f3485373719e24e810b88fcb2af2f85be21f10a5a84f40b1c87d237e002213fdb7ba04b04b35d9806407e2c3fe82d25c001f498ef2754f941ff982586770952a3e4973cff0ef2030f203178a7318903e880fc232c3ff0b42ef0dddae5a4a931f28f75e587fcc0c7bac09dc62802d002f92f92f74a3f003ee387c62a294083e417e28f892d6008f2d292630400f20344000180fc00114000ca12ffada092d0d60bc280b40d1ff8d82be0203f00f18a808f02f000f941a8225008c09e4f0f947a467e4ef3819031d418c701ac21ff9818d91ab97ec46a3e2dfd5d1564c9ffef4ad84dde1b5d16ff0ed48737854107f9cd13fd5ef3cbbcab33eadaf79ea95bdb4718ec8a80f380fc1709efe22b953f26ef27cfee3597cc7d7a38bd79792e082352b9529037135d442b00da374d7bef6a8885bf55c2df5a3b6eaabb39872a08bc5e7d3d8efb7c3d99eb31406495b863feffb1f542fa9bd05e55a569c3918a01e9c2471cf4758ad0f5180c9ceafbb8d2df583b4abaa5f81fe10c3ec4c0411fa2ef7a987c99f0075681b79cfedaa2bd6f214d38a166d04fa3501f0210fb4d3ed39856fb1aae601cf130cc8ab838e8f217a61d4f72ccafe316e2efc8d60fe45fb1121563a2db623b3a563162d4f545a3ae43f28bd5fb19e1a44e8acf55ac367fcbf440decd17e316f1f7aeae1c771d4d668c453f59c52631bc61b6e5d8c95404624a0d3a2b0aba0e2630b6d37d62ef8f217e2b4210d32bde3b290a765103388f84fcb94ed801e46fa546906b81ec20a97eaec122865da43fad3a8088f27ef27cea0326eb01aee5497a0e3cef0fea45910685208617c2caa2b2d3d6e2d2660a10facb3ba4c0b707f97b4d0be6176c4c02fe9a83365d742b025028b3d8b351c0b9fe5edfa7b8c0072190b9d80bb83630524ef99f0268b5f621d0d57f5a7ccec8f5bdae0d4823cd38d05460afe902731b02106aab6fafc73641a5181c27611e336fbc55d8353cf02156fd7b3ba905b68ac5509bcf1add15700d0e7888557f6fef7307a56332b426b44677059a2c029e0746fe29e4b70d9dbb8324acc34583a4c1fe87461c80daad8790c86fe1c58ea0528c8676f16c235bd04d3980cb8006f618f207e906644e439ad74638b7b50068c5751410f9a7d02558119806240223e55e7f294060d77b41fe78d201214e08db84b9a602b5eb54db3a8053c80f7002bd21530e76ef0002daf683fc3801cbd86a5b701b07700af9014ea0770cb67101b51c80f6fb3f1b1f38b6fac03c9e43d822dca9734ea0ae033887fc20202720b160dd09d6e264650710c0ea4f7b2f5815d721b40d577601751cc089e1017a81fc608d0b98b70d5b8e8dcadcace40002a8fc73830fd814e396dbda2bef08547500962bffdcdd07ca3881b77b1e8d3e7ee51d81aa0ee08f5101a0e807aa3a01ab3b032f45ac7f69dc0168d38445f2e7c5e78c9006157196d8bc637050e58c80ab200092fb67e4fd807a80ff8b5e11f33b8d39007d75b345f24f203fd8b21e60f1caf14c39db580a706470101eb9ba1b3420021243161791529cdd9802e8d6df1fac3f201530872f9bb604cb3880b1c12f8ef507a40225b85bc601582bfee5c996972400b0c6095bbbfc666331302d617d326373750cf9410b2e4062cada7672a61cae9d0258ebfb9737a7cc0857d09208c80b39acc5d749ed14c060e7df4ed3ef4e03608913e2882d9d86fdb43330fde48b1e1a23ff14f2830e5c80c4d8d4d0230f94cb9553806fc6e66642780262ad1a973f1380434b13c2ea0f3a760157861eb99a033068ffaf084bd031ae434803d639807d63b93fdb7e805ac0e758c969b7c601586afea1f20f7a81b11d81954d41e98a2f65a9f987ca3fc00594c3caa6a05529c0c8d01cdc108680182c8d511901b0b2fdf748d71ff0c005480c5a3978f62d2407704df80162b1410750f616110f2055ff5be20e7882dbc4c8fb0496399e1a5dfd6fd9fa031ea5019616a44f05c0cafe3fc53f404cd6c3078ebb257bf06ae00b94bef114808eedb589fe99823fee1f07b0e9e200cff22d0088cdfa42355c950258c9ffb1ff80d86ca80eb02800bb061efc85cb3e81c7d65a62d342717a779500584801b0ff8018dd1e43ab02704f7c0162b46101a00008405c313ae7fcdc0164069ef991e61f60a00e20316aa14e952d0a8005073023bc80115888d50f0ec0c20e00f93fa00ed01c761705c0c2fd7f6cff012bb010ab6f9c775a10f0bd0598f65f600a16da82a52538d5971efa8e9c9002c6e07dcc0af7d384fd7f00628dd9616a6430c9ff01758016200230c24e011065cc8e4c38000e00016bb012b322005f515200a28cddaf22001983084094b19b594801e8ff0756e17dec8a00f8de07f0441c01a3f03d76cdf40100009a87893e006a00801a408b2900830800020000880d080000080000000100002000000004c017d0090840c40230609a00200500002000000004000080000000c216808c69024691210008004000bc16002edc04204e3c8a00f8de68b3cb3c01a3f03d765f68040220e2d81501c8c9a300883276731180df0c220051c6ee6f137d00afafaf5c5c0a4cc14acc8a00cc505200a28cd999954e401c00b006330ec0421fc03ef1048cc142cc3ea6ce390b176e90020052808621dc9fa700bed701b2d7d75744009880c6aaeff13a9ba700020b2e803a0020ff6f0e2f8b0260e1059cd40100f97f73785a14000b85c01171058cc042ac3e2e0a406ec15615b915e70280eff9ffc0480a90ff1500e79c9523c18784182046b7c79cf3e9b22520b70220f818fdcb756b02800300c4684b0260612760c0c120e071fe2fb169a14ef5b44a006646c6f9885003c4e656f8cb75b7a460af061e3e77ceed106bc04307f09cd8680176ab1c801517206dc123c20d7846fe5162e408f0e27f2c0bc03d560b80a063f2fe3301b0520738a4290878b4fa4b2c5ad9a15aef008ad4c08a00581a70103e0e1323b7572f733cdda4101ee384b803c462fdd57f9d00fc32f2658614038107f65f62d04a6fcaaf3202303334fe14030131b88503706b54cdc47ea662a7c86b72e210f4b0fa0b479e8d3ceecafe9975b702df1a9a87734211107b1bb192d3eb04e0ded0171bb325087a58fd25e6c6861ef9beb400145641d4e2c5d0973b252401abff5abc28a74b3b00736900b706838e737f4b8bce5a2e7f2600bf8ccd0bb50040ac55e4b2dba0747f12231d4e0a76044017abffb3a14716fbffa58e03b09606087e10a280182bcfe14d0e403a9c1e8c7de10343671a80add55f7afe7f1a7becbdcf2efd7525beb4a5a62041ae5ffa8590050d927fa08ba1292e6cba3ca7ccebc1af8dcd954c10db82a0699c26f65e52bb91bb651c8028df1f8313b667e87d07c0efd5df622a2cf8b2c9096f7400fa0f4c0d7e790a8220e6589a964983d392ffd88dc10190e3c217c42ed872f59718b278157d29ceba0a0361ad18482a0062b5fea56fce4e2bfca313a3f3f893c342a006f925667e1a7dfcd25c751507c55a67e0623e744c58830ab12e79ffd8e0a37fdaf9b78d03105c1b9d4f39323c26ac4149f28f8d92bf3247ab3a0059fd9f8dba00ea0120e4bcff6df54fdecfc3946e82abe4000c6f09ce71473d006c58e0ee0c7f85ebaa1db0aec6206589add350cb10077040ab3058437ecb6f9fae7c1ab66a0d20d15f60d905c8045f12f2600997c6c93fad7314ded5f94d01b880f980b133002c57fc1773ffbd3a0290d6f96dfa8b26c6e79d9d0160bde2bf98fbe7b5b8bc65ce647947608ee362f0a650215af25b3f3352b9f2bfb503501720bff03a8038f8811380fcc657ffda056db7e5205abc24012700f943217f9e6c79f94dbacd6fd75f3c09242e700290df1a26db6e67bb860655f64f47810c2a4e00f25bc0ac88d3836dff91a604c072fbe42ab045181ef9ad6ff52da391b6f6b48927d107b90a6870658bf0076dc341107f1020f9af9a3ad3e29a1ce8248c6dc145d0366c9cfc89fdf6de656cb5edd78a035017200f149a6d96c079d61407d822ff5017a4d0e6eeb8c905296df2c9f40da4b3c006fc6dab931d0253e497b97a08cc8d0a66ebdef2db7b0ab030f859a0832f98169f335202af2dff6560f9fea2f5df6bfadd9769d34f19c839817518ab1b2025f0d3f23f044a7ec1a48d17dfa66d3c69f1a05701a60273642a0217d0ce1bf25f24e174a4aec2ad72aa79aeb66cc742db155886ec121c73cd58afabbe6cf185ecc81aadfa77e200d40584b82bb08ce1dc0dd033d06daebfb0ea879e8e1db75973721d4c96146562785967ae933583a2adc693bca2fb3260bbbf0869f8396bf3177421002136637c86990a410e5d1b8da34cedfe2892afdc49135adaf6b758480562d93a93007dd656e20cea6e4f7c6de57d8e88fc2f6d5bffce044045e031827ac032c62a0497d4076a13ff52893f8eeceb7756584ebbfa46dac17415612c4bfde30f8ea0d68a7f1ae1105c35ddedd76b0d60c504877477401d4c8bcf0dc5c27fe24262e228c2d57e118d9cf1f75d00622b0aae83583cb953f136d6d6628d05a9ea9f100ffd9c3c753d4dfc504580dcf8bde0731b932b5858ed0f8981bf3170d0474399eb3908ee98fb0fc817c4e03130d20f17489f31d51f70d097f8bb9e8342f2bd1fccffa7cee0de629ab060eff759e93f45af77503a0f02e5a2f8714e1c94ca11672a088fbe351ae90ec750093f22a72f0539e177d1e703384f8227b43bdbba4a17f2b920c89fbb4a1bd4ce2f123ec3d657861717cf3a5f460311685c182465785afabb2a5824f5ae5a78881e10f9bd1200440040fec80540452086239e204e48ed66cfa7074a3d1ca403cd6901088afc1adb0902f0992579dfee4204404898259ebe5fc24707f026026a95a6c40e0820e7f7f6e532cef7d1a330088c93dfeb63f0cec228220200f2479402ac4809642027c41430828995b74b3b4ba3cad9016000bdf6f6072d002a02a3e2c7cf84c325c02f4891efbbb523dda9b551d601669b10f884f9651e33737cb23ae27adc549cc088f8033d62a62bbfc95b9d52aba3aebd02e204ae8841d013ae7cdee30fda012cb901b970e2077501d061be7fdce5edbd08c0661188e14591c08f7c3f9817c2a6a1cc8a4e08290168d5f2273d5dde8903202500587e04a08208b04b009ac02c315ce58f2605589112cc7709ce92785e4c0a9a5df5cfac57f9a375004b6e204be27ab534d87ed58fe215ef2ea659a5360062cdf5a34b01d6a40532b13b093b05e05f484cecc444fee81cc0921b907e814bd202ecbee6fa519e2d49639d7599702d12cab9ed1c1e44875cedfe41ace48fda012cb901a9099c26efafa9a63e107e9e2faf65bf8af5b5ec08c06621e05d85101f0188580832158131a31104a6c9fb355da47a084065213851212035b0b7e20bf1af213e02408d00ab0f108046c460ace941c66878855c6dfe94a14000ba108251f1e3883a8117f9fd8dc5fbf8108070d283b1a607b882ee567bb1f9536c3e02e093180c55080ea915b492db4b9bee75cc8d3b08801d311011f886183442fa5fb1f5e82300e189c1be8a0169c2667b2f64bf87f40840a869c248ddc1881179c34c5679f989bd4700621384910ac17e44822084bf57c2cf88020400fceb107693f72bcead5f73fea89f2756780400d417854cc5408461e0a15b9095fc45892e24cf213b0200da1586c18243980bc2d7e4ff42e3a00107f198fc7fa96a5e7c7e2f10feedffb3176f17ff09300005eed12611f41fbe0000000049454e44ae426082"

local markerEnemyHex = "89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a8660000001974455874536f6674776172650041646f626520496d616765526561647971c9653c00000ac04944415478daecdd8d75db4616065048670b700954075107de4ad6ee20ea20ac206205e15660756076907420761077e025a25116b1248a0401cccfbbf71c47398e7f942166f83d0e30afeb000000000000000000000000000000000080fcaefa7f7cfffefdd3e1cb7f0c0784f1dfabababedf302b03a7cf9fdf0e3837181e67d3bfcb83d2c00fbebbf62c0e15f0e5f36c60542d8a439ff5402a414f021a58095f18166edd3bb7f9f02baebbf3f0c78fa89b5f181a6ad9f27ff3f12c020097c3d7cf9689ca039bbc3e4fff7f027ae5f5b218c13b4f9eeffe34fbc58000e2bc4eef0656baca029db34b7ff39df5ffb95e903c1c7ceb620b4a0aff96f86b5ffb112e0f90341db82d086cd6b93ffcd043048027d0a58193fa8d6fe30f96fdefa8fd7effce63be307553b3a87afdefbddb605a15a2fb6fdc62c003f754f77080275e9eff8fbe3d82f78af04e8d21f706f2ca12af7ef4dfe9312404a01b605a11e6f6efb9d9d00520af09c00d4637dcae43f39010c92806d4128dbd16dbf510960e0b3f185a29d3547cf5a00d2bdc43b630c45dabd76bfff6425402a03fa12e0d15843716e9e4ffa99ab04783e3ecc07825096f5b9937f54024829c0b62094e3e46dbf8b13404a01fd5fe4390128c3dd98c93f3a010c92407f8bf04fc61fb2f9e330f96fc7fee6eb0bff72290032bffb5ff29b2f5a001c1f06596dcfddf69bb4044865c0aad3550896f677779f6c0920a580fe1b707c182c6b73e9e49f2401a414a0ab102c67df0dbafb644d002905785a1096b39e62f24f96000649c0f16130af778ff9cab900383e0ce6757bca493f8b96008352a0ffc6b65e2398c576cac93f79024829c0730230bdd1f7fb2f9600520ad05508a6b7997af2cf92000649c0f161308db38ef9ca9a00063c270085cfa5ab39bf6bdb8270b149b7fd965e00fa12c0f16130decd14b7fce628019e9f13d05508c6b99f73f2cf9e00520ab02d08e79b65db6fd104905280e704e07cebb927ff22096090041c1f06a7b9e898afa212c0806d41286cae2cb600a4a38b1ebcb670d4c3a5c77c155902a43260d5d91684636ee6fee43f5709a0ab101cb75e72f22f9e00520ab02d082f2db2ed973501a414a0ab10bc74b7f4e4cf92000649c07302f064d6fbfd8b4a00c37ac7eb0e79e742b605405721f8cb76c96dbf624a805406ac3a5d85886b92ee3eb59600ba0a11dd26e7e4cf9e00520ad0558888f6dd44dd7daa4d002905d81624a2bbdc93bf8804304802b6058922dbb65fc90b80ae4244713b75838f6a4b804129a0ab10116c4b99fc45258094023c2740cbb2dcef5f450248294057215ab62969f217970006494057215a335b779f6612c0c067d70b8d29f29a2e720148f746ef5c33346297f37effea4a805406f42580e3c368c14dee5b7e6b2b017415a215f7a54efea213404a01b605a95971db7ed5248094023c2740cdee4a9efcc527804112d05588da2cd6dda7d904305c495d4fd4f6ee5fc33759c502a0ab1095792875dbafca12209501abceb62075b829f993ff1a4b005d85a8c5ba96c95f55024829c0f16194ac9ff8b7a57ff25f65024829e09b1440e1effedfaa9a53358eb2e3c3285031c77c359b00862badeb0dd764d0054057210ab3ad65dbaf8912209501ab4e5721f2cbdedd276209a0ab10a5d8d43af9ab4e008324e0f8307229f298af100960c07302b8f6a2268094026c0bb2b42ab7fd5a5d0074156269b72535f8885c02e82ac4d2b62d4cfe6612404a018e0f6309c51ff3152e01a414e0390196b06e65f23795000649c0b62073a97edbafd90430a0ab10aeada80b80ae42cc6457ebfdfea14a805406f42580e3c398d24dcdb7fc462a011c1fc6d4d62d4efe6613404a01b605994253db7e2112404a01ba0a3185bb56277fd309609004741562ac2abafb4800eface0ae635c3b4117005d8518e9a1c56dbf7025402a03569de3c3385dd5c77c49002f5340ff423a3e8c536d224cfe300920a5005d8538c5beabacbb8f04705a0af0b420a7584799fca112c02009383e8cb73471cc9704f0ce0aef3ac7b5117401d05588376c236cfb852f015219e03901869abedf5f02789902fa17dab620cf3611277fd8043048028e0fa3b963be2480d3794e80d0d7c055f457dfb66068e1b6fd2c002f17005d85e2ba6da5c1871260ec0af87401dc9b0be1dc479ffc12c0ff53806dc158c26efb4900afa700cf09c4b236f92580d792806dc1f685def693008ed355c86b6c01085c0aec3ac787b5ec21e2fdfe4a80f3ca80be04d055a84d37514efa9100c6a780fe02f181607bd626bf04706a0ab02dd816db7e12c059294057a1b6dc99fc12c09824a0ab50fd9aefee2301ccf8ce6108bc861680b8a5c0ae737c58cdb6b6fd9400979601ab4e57a11a85e9ee2301cc9b02fa0bc8f161f5d998fc12c054294057a1baecbb40dd7d2480f95380a705ebe2693f09609624e0f8b0f2853fe6cb0230df02e0f8b0f2dd3ae94709305729d05f585b2351acadc92f01cc9d023c275026f7fb4b008ba4005d85cab431f92580259380e3c3cae1982f0960718e96f25a5800029702bbc3979d91c86ee77e7f2540ae32a02f011c1f969763be24806c29a0bff07415cae7dee4970072a700db8279d8f693008a48019e13c8c3fdfe12405149c0f161cb71cc9704501c474f196b0b40e05260d7e92ab404dd7d9400c59601abceb6e0dc6cfb4900c5a680fec2f481e07c74f791008a4f01b605e761db4f02a82205e82a340fdd7d2480aa9280e3c3a6e3982f09a0be7ad510184b0b40dc5260d7393e6c0abafb2801aa2d03569dae4297d0dd4702a83a05f417aee3c3c6d3dd4702a83e05e82a34cebed3dd4702682005d8161cc7b69f04d05412b02d783adb7e1680e616005d854ea7bb8f12a0b9524057a1d3e8ee2301349b023c27709cfbfd2580a65380e3c38e73cc9704102209e82af492ee3e1240183ad918130b40e05260d7e92a34a4bb8f12205c19d097008e0f7be2982f09205c0ae82f785d8574f7910002a780e8db82b6fd2480d02920fa7302eef7970008da5548771f0980e77742ffcf5800e29602bb2e565721dd7d9400fc5006acba38db82b6fd24007e4801fd8488f09c80ee3e12006fa480d68f0feb27be63be2400de4801ad3f2de8693f09801392408bc78739e64b02e0d4774aff4f5800e29602bbaeade3c374f75102706619b0eadae82aa4bb8f04c08814d04f9816ba0ae9ee2301704112a8f9f830c77c49005ce8cef78e04103b05d4b82d68dbcf02c0440b408d5d8574f7510230c92afd34916a3a3eecdee49700983605d4727c9863be2400664801b53c27e07e7f0980199340c9db82b6fd240066f6d9f78605206e29b0ebcaec2aa4bb8f128085ca80be0428edf830c77c49002c9402fa8956d207828ef9920058380594b22d68db4f0220430a28a5ab90ee3e1200199340ceae42bafb4800e47e070efa770329057cf9bebc2f465e0940190bc0aa5bf6f830c77c29012866155ffef830c77c490014960296ea2ab4ef74f79100282e052cf5b4a0a7fda0e024f075c60ffebe1a61287b01f838e302f0d10843f98bc06f334cfedf8c6c83a5a32168720198fa3901f7fb37ca87802daeea4f1375ca6dc18dc90ff52581c709a2ffa3919400a8d35d217f069029057cb5ed07711780d5050bc0ca0842fd8bc0af2326ffaf460eda58003e1c7efc79c6e4ff336d25028d2c023f9fb100fc6cc4a0bd45e0d1b61fc45d003ebadf1f622f025f1cf305711780956d3f88bd08fcf2cae4ffc5c8408c05e0c76d41db7e106c11f83458003e191188b708fc9e3a0b11d4bf0c41689ef4030000000000000000000000000000000000c8ee7f020c0092a4b893ab7144730000000049454e44ae426082"

local markerBombHex = "89504e470d0a1a0a0000000d49484452000001000000010008060000005c72a8660000001974455874536f6674776172650041646f626520496d616765526561647971c9653c000005424944415478daecdd81515a4b148061960a2c012a901248075a815a81930aa21564ac40ad2074a025680552021ddc9cd52523115494ab70f7fb66eef0de9b8464f6cdf9d9bda0a65ecb9aa619c4c338aefdb846710dca052c9a96eb2eaefbb86e534ad336ffc0d4d2d0e7413f8aebc0b0c3a7a33089eb3a6270b7b50188a1df2b03ffcbd0436b3138cf418818ccb6260031fc67f1701ad79eff47d0ba3cfc171181b36f0d400c7e7ec5ffed151fbe6d47f0334230f9d20094edfe65d9f203df2b07e0e423c782f481e11fc7c31fdb7dd8ba63c16144e0769ddfd45f73f88fe3e1c6f0c3d6c93379536674f33b8078e2bce53fb6ceb0f5ae622770b2b100187ee8660492e1877a23d07fc799dff0c36e3a7eeb9e407a65f8c7bda71b7ec06efbb1eadd81b462f8f31dc5879ebbfdd005f92dc2e1b2cf09ac3a025c1a7ee88cf907f7debe07503edeeb137ed02d0765b65f3f02c42fca5bff81f582ce99c63160b8720750beaacff043370dca8cbfdc01b8f1075558b821f87c077060f8a1f3e6dfb8e7c50ec0d91f2abb17d02fc33f32fc50d5bd80d1f323c0913581aa1cfd3b02d8fe439dc78054be6fff83f580ea0cf311606c1da04ae31c807deb0055dacf01185907a8d2280760601da04a837c13b0b10e50a7be25000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400040000001000400100040000001000400100040000001000400100040000001000400100040000001000400100040000001000400100040000001000400100040000001000400100040000001000400100040004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000000100040010004000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400000010004001000400040000001000400100040000001000400100040000001000400100060970230b50c50a5a90040e501b8b30e50a5bb1c807beb0055ba4f4dd30ce21f1eac055467d84f294ddd0780faceff79f6e76f034eac0754e571e6e701b8b61e5095c7994ff37f6b9a26df07185817a862fb3f7cbe03c8cead0b54e1dfac3fdf01ecf59ede0dd8b33ed059b3b886b103982dec00ca7fb8b03ed06917f3e15fd801b81700f59cfde7967d35e04feb049df462b65f04200a91df1ff4b900e8964999edc5795ff62bdd10844e59b8f1f7d611607e43f0d0ba41271c2e1bfe95012811b88d87136b073beda4cc726fad0094085cc5c39535849d74556678f58cbfe7599aa6b98c8763eb093b35fc6feee0d37b9f4d04a05bc3bf56004a0472002ead2f6cf599ffddc7f6b4eeb34704c6f1f0a7e72d42d8268fefdcbd76c36f99b57f2e40f903f2c7097d5808b6439ec5e1bac3ffa1009408cce2ca9f13c8d7d4fac3b7989657fd95eff36ffc08b0e25870160fa78e05f065dbfdfc557d679f7da2b4a9bf51f9f8f0415cbf7abe9a10da7ac5cfdfcc63f2d157fcd602f05f0c46f17054822006f0b9a1cf67fceb18fa8dff109fd4f6dfbefcdc81715cfb718d4a104401960f7bbef2a0e71fd8735bbe6d7f6bfe0a30005fba016bc98e75120000000049454e44ae426082"
--endregion

--region Compass
--- @class CompassPingMarker
--- @field origin Vector3
--- @field timer Timer
--- @field urgent boolean

--- @class Compass : Class
--- @field enabled boolean
--- @field displayWhenDead boolean
--- @field baseColor Color
--- @field backgroundColor Color
--- @field backgroundColorTransparent Color
--- @field increment number
--- @field markInterval number
--- @field position Vector2
--- @field width number
--- @field height number
--- @field fade number
--- @field rigidity number
--- @field pingMarkers CompassPingMarker[]
--- @field markerDimensions Vector2
--- @field markerGeneric Texture
--- @field markerEnemy Texture
--- @field markerBomb Texture
--- @field markerColorPing Color
--- @field markerColorPingUrgent Color
--- @field markerColorEnemy Color
--- @field markerColorBomb Color
--- @field currentBearing number
--- @field currentAngle Angle
local Compass = {}

--- @return Compass
function Compass:new()
	return Nyx.new(self)
end

--- @return void
function Compass:__init()
	self:initFields()
	self:initMenu()
	self:initCallbacks()
end

--- @return void
function Compass:initFields()
	self.baseColor = Color:rgba(255, 255, 255, 255)
	self.backgroundColor = Color:rgba(0, 0, 0, 25)
	self.backgroundColorTransparent = Color:rgba(0, 0, 0, 25)
	self.markerColorPing = Color:rgba(43, 163, 255, 255)
	self.markerColorPingUrgent = Color:rgba(255, 103, 43, 255)
	self.markerColorEnemy = Color:rgba(255, 43, 43, 255)
	self.markerColorBomb = Color:rgba(255, 43, 43, 255)
	self.position = Client.getScreenDimensionsCenter()
	self.markerDimensions = Vector2:new(0, 0)
	self.markerGeneric = Texture:newFromString(Data.hexToBinary(markerGenericHex), 256, 256)
	self.markerEnemy = Texture:newFromString(Data.hexToBinary(markerEnemyHex), 256, 256)
	self.markerBomb = Texture:newFromString(Data.hexToBinary(markerBombHex), 256, 256)
	self.pingMarkers = {}
	self.currentAngle = Client.getCameraAngles()
	self.currentBearing = self.currentAngle:getBearing()
end

--- @return void
function Compass:initMenu()
	local menu = Menu:new("config", "presets")

	local enabled = menu:checkbox("Enable compass"):addCallback(function(item)
		self.enabled = item:get()
	end):set(true)

	local baseColor = menu:colorPicker("Compass base color", self.baseColor)
	local backgroundColor = menu:colorPicker("Compass background color", self.backgroundColor):addCallback(function()
		self.backgroundColorTransparent = self.backgroundColor:clone():setA(0)
	end)

	local displayWhenDead = menu:checkbox("Show compass when dead / spectator"):addCallback(function(item)
		self.displayWhenDead = item:get()
	end):set(false)

	local sizing = menu:combobox(
		"Compass sizing",
		{"Small", "Medium", "Large", "Huge"}
	):addCallback(function(item)
		local sizingValue = item:get()

		if sizingValue == "Small" then
			self.increment = 2
			self.markInterval = 15
		elseif sizingValue == "Medium" then
			self.increment = 3
			self.markInterval = 10
		elseif sizingValue == "Large" then
			self.increment = 15
			self.markInterval = 2
		elseif sizingValue == "Huge" then
			self.increment = 45
			self.markInterval = 1
		end
	end):set("Large")

	local position = menu:slider("Compass position (Y)", 0, 100, {
		default = 95,
		unit = "%"
	}):addCallback(function(item)
		self.position:set(nil, item:get() / 100 * Client.getScreenDimensions().y)
	end)

	local width = menu:slider("Compass width", 50, 900, {
		default = 220,
		unit = "px"
	}):addCallback(function(item)
		self.width = item:get()
	end)

	local height = menu:slider("Compass height", 15, 45, {
		default = 20,
		unit = "px"
	}):addCallback(function(item)
		self.height = item:get()
	end)

	local fade = menu:slider("Compass fade-out point", 20, 180, {
		default = 80,
		unit = "°"
	}):addCallback(function(item)
		self.fade = item:get()
	end)

	local rigidity = menu:slider("Compass rigidity", 1, 11, {
		default = 5,
		unit = "x",
		tooltips = {[11] = "Completely rigid"}

	}):addCallback(function(item)
		self.rigidity = item:get()
	end)

	enabled:addChildren({
		baseColor,
		backgroundColor,
		sizing,
		displayWhenDead,
		position,
		width,
		height,
		fade,
		rigidity
	})
end

--- @return void
function Compass:initCallbacks()
	Callbacks.paint(function()
		self:think()
	end)

	Callbacks.playerPing(function(ping)
		self.pingMarkers[ping.user.eid] = {
			origin = ping.origin,
			timer = Timer:new():start(),
			urgent = ping.urgent
		}
	end)
end

--- @return void
function Compass:think()
	if self.enabled == false then
		return
	end

	if self.displayWhenDead == false and Player.isAlive() == false then
		return
	end

	self:thinkFields()
		self:thinkDrawBase()
		self:thinkDrawMarkers()
	end

--- @return void
function Compass:thinkFields()
	local markerDimension = self.height * 0.75

	self.markerDimensions:set(markerDimension, markerDimension)

	local targetAngle = Client.getCameraAngles()
	local targetBearing = targetAngle:getBearing()

	if self.rigidity == 11 then
		self.currentAngle = targetAngle
		self.currentBearing = targetBearing
	else
		self.currentAngle = self.currentAngle + (targetAngle - self.currentAngle):normalize() * self.rigidity * Time.delta()
		self.currentBearing = self.currentBearing + (targetBearing - self.currentBearing) * self.rigidity * Time.delta()
	end
end

--- @return void
function Compass:thinkDrawBase()
	local maxHeight = self.height + (self.height * 0.66)
	local position = self.position:clone()

	position:clone():offset(-self.width, -3):drawGradient(
		Vector2:new(self.width, maxHeight + 6),
		self.backgroundColorTransparent,
		self.backgroundColor,
		true
	)

	position:clone():offset(0, -3):drawGradient(
		Vector2:new(self.width, maxHeight + 6),
		self.backgroundColor,
		self.backgroundColorTransparent,
		true
	)

	position
		:clone():offset(0, -14)
		:drawText(self.baseColor, "c", 0, string.format("%s°", math.floor(self.currentBearing)))

	position:drawTriangle(
		position:clone():offset(0, 0),
		position:clone():offset(-6, -6),
		position:clone():offset(6, -6),
		self.baseColor
	)

	local angle = Angle:new(0, -180)
	local incrementDimensions = Vector2:new(1, self.height)
	local cardinalDimensions = Vector2:new(3, maxHeight)
	local interval = 0

	while angle.y < 180 do
		local incrementPosition = position:clone()
		local incrementAngle = angle:clone()
		local incrementColor = self.baseColor:clone()

		self:setMarkerData(incrementPosition, incrementAngle, incrementColor)

		if incrementColor.a > 0 then
			if incrementAngle:isAtCardinalDirection() then
				-- Cardinal bearings
				incrementPosition:drawRectangle(cardinalDimensions, incrementColor)

				incrementPosition:clone():offset(0, cardinalDimensions.y + 10):drawText(
					incrementColor, "cb", 0, incrementAngle:getCardinalDirection()
				)
			elseif interval % self.markInterval == 0 then
				-- Marked bearings
				incrementPosition:drawRectangle(incrementDimensions, incrementColor)

				incrementPosition:clone():offset(0, incrementDimensions.y + 10):drawText(
					incrementColor, "cb", 0, string.format(
						"%s°",
						math.floor(incrementAngle:getBearing())
					)
				)
			else
				-- Unmarked bearings
				incrementPosition:drawRectangle(incrementDimensions, incrementColor)
			end
		end

		angle:offset(0, self.increment)

		interval = interval + 1
	end
end

--- @return void
function Compass:thinkDrawMarkers()
	-- Enemies
	for _, enemy in pairs(Player.find(function(p)
		return p:isEnemy()
	end)) do
		self:drawMarker(enemy:getOrigin(), self.markerEnemy, self.markerColorEnemy:clone())
	end

	-- Pings
	for id, marker in pairs(self.pingMarkers) do
		self:drawMarker(
			marker.origin,
			self.markerGeneric,
			marker.urgent and self.markerColorPingUrgent:clone() or self.markerColorPing:clone()
		)

		if marker.timer:elapsed(6) then
			self.pingMarkers[id] = nil
		end
	end

	-- Bomb
	local bomb = Entity.findOne({"CC4", "CPlantedC4"})

	if bomb ~= nil then
		local displayBomb = false

		if bomb.classname == "CPlantedC4" then
			displayBomb = true
		elseif Player.isTerrorist() and bomb:m_hOwnerEntity() == nil then
			displayBomb = true
		elseif bomb:m_bSpotted() == 1 and bomb:m_hOwnerEntity() == nil then
			displayBomb = true
		end

		if displayBomb then
			self:drawMarker(bomb:getOrigin(), self.markerBomb, self.markerColorBomb)
		end
	end
end

--- @param position Vector2
--- @param angle Angle
--- @param color Color
--- @return void
function Compass:setMarkerData(position, angle, color)
	position.x = position.x - self.width * math.sin(math.rad(angle.y) - math.rad(self.currentAngle.y))

	color:setA(Math.clamp(
		Math.pcti(self.currentAngle:getAbsDiff(angle).y, self.fade) * 255,
		0,
		255
	))
end

--- @param origin Vector3
--- @param png Texture
--- @param color Color
function Compass:drawMarker(origin, png, color)
	local position = self.position:clone():offset(-self.markerDimensions.x / 2, self.markerDimensions.y * 0.25)

	self:setMarkerData(position, Client.getCameraOrigin():getAngle(origin), color)

	if color.a == 0 then
		return
	end

	png:renderUi(position, color, self.markerDimensions, false)
end

Nyx.class(
	"Nyx/Compass",
	Compass
)
--endregion

Compass:new()