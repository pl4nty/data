-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d4b34bbf6b7a\1_luac 

-- params : ...
-- function num : 0
reportRelatedBmHits()
addRelatedProcess()
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= "" and l_0_0 ~= nil and check_common_process_linux(l_0_0) == false then
  (bm.add_threat_file)(l_0_0)
end
return mp.INFECTED

