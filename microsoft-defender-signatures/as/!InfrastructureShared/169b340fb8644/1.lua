-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\169b340fb8644\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[7]).utf8p1)
end
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC57: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("/var/tmp/")("/tmp/") do
    -- DECOMPILER ERROR at PC62: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC62: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC63: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC64: Overwrote pending register: R11 in 'AssignReg'

    if ("/var/run/")("/var/spool/", "/home/", "/mnt/") == l_0_7 then
      (bm.add_related_file)(l_0_1)
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

