-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\22_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2 = nil
  if (sysio.GetFileAttributes)(l_0_0) == nil or (sysio.GetFileAttributes)(l_0_0) == 4294967295 then
    return mp.CLEAN
  end
  if (mp.bitand)((sysio.GetFileAttributes)(l_0_0), 2) == 2 and (mp.bitand)((sysio.GetFileAttributes)(l_0_0), 4) == 4 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

