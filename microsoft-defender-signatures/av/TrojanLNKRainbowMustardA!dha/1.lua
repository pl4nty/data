-- Threat: Trojan:LNK/RainbowMustard.A!dha
-- Type: 13
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.getfilesize()
if 512000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetLnkInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.Arguments
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "-w 1 -NonI -c \"$a=$env:test=\\\"$env:temp", 1, true) ~= nil and string.find(l_0_2, "Get-ChildItem -Path $env:temp\\*Rar* -Recurse).FullName|where{$_ -match", 1, true) ~= nil and string.find(l_0_2, "$a;$b=New-Object -ComObject Scripting.FileSystemObject;$c=$b.OpenTextFile(", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
