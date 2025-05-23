-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\375b392a1f404\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" and isTainted(l_0_0, "new_elf_file_created_hint") then
  addRelatedProcess()
  reportRelatedBmHits()
  TrackPidAndTechniqueBM("BM", "T1106", "Execution_NativeAPI_RansomGoLangCryptoAPI")
  return mp.INFECTED
end
return mp.CLEAN

