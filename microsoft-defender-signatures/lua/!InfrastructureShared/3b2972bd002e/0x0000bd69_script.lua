-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3b2972bd002e\0x0000bd69_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC19: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("/var/lib/puppet/client_data/catalog/")("/mdatp-fullscan.sh") do
    -- DECOMPILER ERROR at PC24: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC26: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC27: Overwrote pending register: R9 in 'AssignReg'

    if (("/.command_history").find)("/.zsh_history", "/testing_mdatp.sh", 1, true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

