-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3b1146a0c\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[5]).utf8p2
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC54: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

  if not ("Wovdnut")("AsyncRat", "Donut") then
    return mp.CLEAN
  end
else
  do
    do return mp.CLEAN end
    local l_0_2 = nil
    -- DECOMPILER ERROR at PC95: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC109: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC113: Unhandled construct in 'MakeBoolean' P3

    if (((this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and not (this_sigattrlog[3]).matched) or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p2 ~= nil then
      do return mp.CLEAN end
      if (sysio.IsFileExists)(l_0_2) and (mp.IsKnownFriendlyFile)(l_0_2, true, false) == false then
        (bm.add_threat_file)(l_0_2)
      end
      do
        local l_0_3, l_0_4 = pcall(reportBmInfo)
        -- DECOMPILER ERROR at PC142: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC143: Overwrote pending register: R6 in 'AssignReg'

        if not l_0_3 and l_0_4 then
          (bm.add_related_string)("bmInfoFailReason", ("Rugmi")("HeavensGate"), bm.RelatedStringBMReport)
        end
        do return mp.INFECTED end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

