-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3ed7c46f4154\0x00000dae_luac 

-- params : ...
-- function num : 0
local l_0_0 = add_parents_mp()
set_research_data("AdditionalInfo", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_0)))
return mp.INFECTED

