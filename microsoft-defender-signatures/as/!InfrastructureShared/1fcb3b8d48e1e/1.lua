-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1fcb3b8d48e1e\1.luac 

-- params : ...
-- function num : 0
do
  if ((((this_sigattrlog[1]).matched and (this_sigattrlog[6]).matched) or ((this_sigattrlog[2]).matched and not (this_sigattrlog[7]).matched and (this_sigattrlog[8]).matched) or ((this_sigattrlog[3]).matched and (this_sigattrlog[9]).matched) or (this_sigattrlog[4]).matched)) then
    local l_0_0 = (this_sigattrlog[10]).matched
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = nil
  if (bm.get_imagepath)() == nil then
    return mp.CLEAN
  end
  if (MpCommon.PathToWin32Path)((bm.get_imagepath)()) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC82: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

  do
    if not (string.find)((string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), "\\users\\", 1, true) and not (string.find)((string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), "\\temp\\", 1, true) then
      local l_0_2 = nil
    end
    if not (string.find)((string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)())), "\\downloads\\", 1, true) then
      return mp.CLEAN
    end
    add_parents()
    return mp.INFECTED
  end
end

