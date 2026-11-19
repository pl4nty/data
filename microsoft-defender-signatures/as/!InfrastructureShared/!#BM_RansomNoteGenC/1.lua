-- Threat: !InfrastructureShared
-- Name: !#BM_RansomNote:Gen.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE & (Lua:TXTExt | Lua:HTMExt | Lua:HTMLExt | Lua:HTAExt | BM_HasRansomNoteString)

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 5120 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat1")
local l_0_2 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat2")
local l_0_3 = mp.enum_mpattributesubstring("SCPT:ClnWordsCat3")
if 1 <= #l_0_1 or 5 <= #l_0_1 + #l_0_2 or 3 <= #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat1")
local l_0_5 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat2")
local l_0_6 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat3")
local l_0_7 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat4")
local l_0_8 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat5")
local l_0_9 = mp.enum_mpattributesubstring("SCPT:RansomNoteCat6")
if 4 <= #l_0_7 and 2 <= #l_0_4 + #l_0_5 and 3 < #l_0_6 + #l_0_8 + #l_0_9 then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
if mp.get_mpattribute("SCPT:RansomRuyk") and 1 <= #l_0_7 and 1 <= #l_0_6 then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN
