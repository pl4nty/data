-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\16bb37201fd21\0x00000a06_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (bm.add_related_string)("file_metadata", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1556.003", "CredentialAccess_ModifyAuthenticationProcess_PluggableAuthModules_pam.d")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

