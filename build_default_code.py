#
#
# Author : fcbruce
#
# Time : Fri 10 Oct 2014 03:07:39 PM CST
#
#

"""

  auto translate your default code into vim source code in vimrc
  you just add your code in the text file which named 'default_code'
  and the vim source code will be built in the file 'used_in_vimrc'

  for example,you need add the following code in your cpp files:

    #include<bits/stdc++.h>

    using namespace std;

    int main()
    {


      return 0;
    }

  you could paste above code in the text file 'default_code', then run 
  this scrpit, you will get the following code in the file 'used_in_vimrc':

    call setline(1,"#include<bits/stdc++.h>")
    call append(line("."),"")
    call append(line(".")+1,"using namespace std;")
    call append(line(".")+2,"")
    call append(line(".")+3,"int main()")
    call append(line(".")+4,"{")
    call append(line(".")+5,"")
    call append(line(".")+6,"")
    call append(line(".")+7,"  return 0;")
    call append(line(".")+8,"}")

  and you could paste above code in file '.vimrc'

"""

file_read=open('default_code','r')
file_write=open('used_in_vimrc','w')

line_number=0;
for line in file_read:
  s=""

  for ch in line:
    if ch=='\"': s+='\\'
    s+=ch

  if line_number==0:
    file_write.write ("call setline(1,\"%s\")\n" % s[:-1])
  elif line_number==1:
    file_write.write ("call append(line(\".\"),\"%s\")\n" % s[:-1])
  else:
    file_write.write ("call append(line(\".\")+%d,\"%s\")\n" % (line_number-1,s[:-1]))
  line_number+=1
  
