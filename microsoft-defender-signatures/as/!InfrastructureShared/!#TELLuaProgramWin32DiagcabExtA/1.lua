-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:Program:Win32/DiagcabExt.A
-- Type: 13
-- MpAttributes: SCRIPT:Program:Win32/DiagcabExt.A

local l_0_0 = mp.getfilename()
if string.sub(l_0_0, -8) == ".diagcab" then
  return mp.INFECTED
end
return mp.CLEAN
