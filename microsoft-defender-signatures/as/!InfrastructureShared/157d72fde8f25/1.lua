-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\157d72fde8f25\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
do
  do
    local l_0_1, l_0_2, l_0_4, l_0_5, l_0_8, l_0_10, l_0_13, l_0_15 = (mp.GetProcessCommandLine)(l_0_0) or ""
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

    if not (string.find)(l_0_1, "%f[%w]nc%s") ~= nil and not (string.find)(l_0_1, "%f[%w]telnet%s") ~= nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

    if (string.find)(l_0_1, "%f[%w]nc%s") ~= nil and (string.find)(l_0_1, "%f[%w]nc%s+[^|]-%-U%f[%W]") ~= nil then
      return mp.CLEAN
    end
    if verify_non_prod_rings() then
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

