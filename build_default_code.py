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
  
