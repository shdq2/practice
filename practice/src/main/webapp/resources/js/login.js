$('#login').click(function(){
var email=null;
		swal({			
				title:"로그인",
				content:{
					element:"input",
					attributes:{
						placeholder:"아이디 입력",
						type:"text",
					},
				},
				button:{
					text:"다음",
					closeModal:false,
				}
			})
			.then((value) => {
				email = value;
				return fetch('json_idcheck.do?email='+value);			      
			})
			.then(results =>{
				return results.json();
			})
			.then(json =>{
				if(json == 1){
					swal({
						title:"로그인",
						content:{
							element:"input",
							attributes:{
								placeholder:"비밀번호 입력",
								type:"password",
							},
						},
						button:{
							text:"로그인",
							closeModal:false,
						}
					}).then((value) => {
						return fetch('json_login.do?email='+email+'&pw='+value);		      
					})
					.then(results =>{
						return results.json();
					})
					.then(json =>{
						if(json == 0){
							swal("암호가 틀렸습니다",{
								icon:"warning",
								dangerMode:true
							});
						}else{
							swal("환영합니다",{
								icon:"success",
								button:{
									text:"확인"
								}
							}).then((value)=>{
								window.location.href="/practice/";
							});
							
						}
					});
				}else{
					swal("아이디가 존재하지 않습니다",{
						icon:"warning",
						dangerMode:true
					});
				}
			})
	});