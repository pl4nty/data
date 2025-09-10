-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a9b3998ea88a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  local l_0_2 = nil
  local l_0_3 = contains
  local l_0_4 = l_0_2
  l_0_3 = l_0_3(l_0_4, {"powershell", " mshta", " bitsadmin", "curl"})
  if l_0_3 then
    l_0_3 = bm
    l_0_3 = l_0_3.add_related_string
    l_0_4 = "typedpath"
    l_0_3(l_0_4, tostring(l_0_2), bm.RelatedStringBMReport)
    l_0_3 = add_parents
    l_0_3()
    l_0_3 = bm
    l_0_3 = l_0_3.get_process_relationships
    l_0_3 = l_0_3()
    for l_0_8,i_2 in ipairs(R4_PC46) do
      local l_0_10 = (mp.bitand)(i_2.reason_ex, bm.RELATIONSHIP_CREATED)
      local l_0_11 = l_0_9.image_path
      if l_0_11 and l_0_9.ppid and l_0_10 == bm.RELATIONSHIP_CREATED then
        local l_0_12 = nil
        local l_0_13 = contains
        local l_0_14 = l_0_11
        l_0_13 = l_0_13(l_0_14, {"powershell.exe", "mshta.exe", "bitsadmin.exe", "curl.exe", "cmd.exe"})
        if l_0_13 then
          l_0_13 = bm
          l_0_13 = l_0_13.trigger_sig
          l_0_14 = "StartedViatypedpaths"
          l_0_13(l_0_14, "StartedViatypedpaths", l_0_9.ppid)
        end
      end
    end
    return mp.INFECTED
  end
  l_0_3 = mp
  l_0_3 = l_0_3.CLEAN
  return l_0_3
end

