-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASetRemoteMpAttribute\0x00001d97_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC22: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("sftp-server")("vsftpd") do
    if l_0_0 == l_0_7 then
      (mp.set_mpattribute)("MpRemoteTransfer")
      return mp.INFECTED
    end
  end
  for l_0_11,l_0_12 in ipairs(l_0_2) do
    if l_0_0 == l_0_12 then
      (mp.set_mpattribute)("MpRemoteDownload")
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

