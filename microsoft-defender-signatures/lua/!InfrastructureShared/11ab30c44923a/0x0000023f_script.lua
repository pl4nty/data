-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11ab30c44923a\0x0000023f_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
    bm_AddRelatedFileFromCommandLine(l_0_0, nil)
    AddResearchData((this_sigattrlog[1]).ppid, true)
    return mp.INFECTED
  end
  return mp.CLEAN
end

