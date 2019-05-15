call_father("jack","peter").
child("jack").
person("peter").
person("sam").
abnormal("peter"):-child("jack"),person("peter"),not father("peter","jack").
abnormal("sam"):-child("jack"),person("sam"),not father("sam","jack").
father("peter","jack"):-child("jack"),person("peter"),call_father("jack","peter").
father("sam","jack"):-child("jack"),person("sam"),call_father("jack","sam").
