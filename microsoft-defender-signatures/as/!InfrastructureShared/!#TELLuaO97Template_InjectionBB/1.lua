-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:O97/Template_Injection.BB
-- Type: 13
-- MpAttributes: SCPT:O97M/TemplateInj.B

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("->word/_rels/", 1, true) or l_0_0:find("/drawings/_rels/", 1, true) or l_0_0:find("/worksheets/_rels/", 1, true) then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FNAME)
  local l_0_2 = string.find(l_0_1, "->")
  local l_0_3 = string.sub(l_0_1, 0, l_0_2 - 1)
  local l_0_4 = {}
  table.insert(l_0_4, l_0_3)
  MpCommon.SetPersistContextNoPath("TemplateInjc", l_0_4, 100)
  return mp.INFECTED
end
return mp.CLEAN
