-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:O97/Template_mhtm_Injection.SA
-- Type: 13
-- MpAttributes: SCPT:O97M/TemplateMhtmlInj.A | SCPT:OleMshtmlHttpUsc.A | SCPT:OleMshtmlTargetExternal.A

local l_0_0 = mp.getfilesize()
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if 1536000 < l_0_0 then
  return mp.CLEAN
end
if l_0_1:find("->word/_rels/", 1, true) or l_0_1:find("/drawings/_rels/", 1, true) or l_0_1:find("/worksheets/_rels/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
