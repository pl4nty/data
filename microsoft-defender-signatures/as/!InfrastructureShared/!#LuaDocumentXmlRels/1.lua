-- Threat: !InfrastructureShared
-- Name: !#Lua:DocumentXmlRels
-- Type: 13
-- MpAttributes: SCPT:O97XML.OLELink.1 | SCPT:O97XML.OLELink.2 | SCPT:O97XML.OLELink.3 | SCPT:O97XML.OLELink.4

local l_0_0 = string.lower(mp.getfilename())
local l_0_1 = "->word/_rels/document.xml.rels"
if #l_0_0 > #l_0_1 and l_0_0:sub(-#l_0_1) == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
