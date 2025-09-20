-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\48b34b5faf03\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = nil
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC67: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R4 in 'AssignReg'

  if ("system.directoryservices.activedirectory.domain")("hidden -encodedcommand", "export-registry") then
    return mp.INFECTED
  end
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

