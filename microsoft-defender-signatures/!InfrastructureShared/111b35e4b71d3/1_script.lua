-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\111b35e4b71d3\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC49: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1, l_0_2 = ((this_sigattrlog[2]).utf8p2):lower()
    end
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

    if not l_0_1 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_3 = nil
    if extractDllForRegproc(l_0_1) and checkFileLastWriteTime(extractDllForRegproc(l_0_1), 3600) == false and (mp.IsKnownFriendlyFile)(extractDllForRegproc(l_0_1), true, false) == false then
      (bm.add_related_file)(extractDllForRegproc(l_0_1))
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

