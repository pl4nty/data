-- Threat: !InfrastructureShared
-- Name: !#Lua:ExtractCompressedScript
-- Type: 24
-- MpAttributes: SCPT:PowerShell.InvokeObfuscation.Decompress | ((SCRIPT:PythonImportZlib | SCPT:Ruby/ImportZlib | SCPT:Perl/ImportZlib) & SCPT:VBSBase64)

local l_0_0 = mp.getfilesize()
if 200000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
l_0_1 = string.gsub(l_0_1, "%z", "")
local l_0_2 = l_0_1:gmatch("[%w+/]+=?=?")
for l_0_3 in l_0_2, nil, nil do
  if 80 < #l_0_3 then
    if mp.get_mpattribute("SCPT:PowerShell.InvokeObfuscation.Decompress") then
      mp.vfo_add_buffer("CWSHACK\000X\133" .. MpCommon.Base64Decode(l_0_3), "[PwsZlib]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    else
      mp.vfo_add_buffer("CWSHACK\000" .. MpCommon.Base64Decode(l_0_3), "[PwsZlib]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    end
  end
end
return mp.CLEAN
