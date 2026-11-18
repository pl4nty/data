-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:O97/Template_Injection.F
-- Type: 13
-- MpAttributes: SCPT:O97M/TemplateInj.F

local l_0_0
l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("->word/_rels/", 1, true) or l_0_0:find("/drawings/_rels/", 1, true) or l_0_0:find("/worksheets/_rels/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
