-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:Possible_Offiz_Beacon.A
-- Type: 13
-- MpAttributes: SCPT:Exploit:Possible_Offiz_Beacon

local l_0_0 = mp.getfilename()
if l_0_0:find("->word/_rels/document.xml.rels", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
