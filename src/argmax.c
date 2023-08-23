logic
if(len < 0) exit
int max = s[0]
int index = 0;
for i = 1 to len
{
    if(s[i] > max )
    {
        max = s[i];
        index = i;
    }
}
return index