-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e6b3580aeafd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[10]).matched then
  local l_0_0, l_0_8, l_0_9 = nil
  l_0_8, l_0_9 = l_0_0:match, l_0_0
  l_0_8 = l_0_8(l_0_9, "([^\\]+)$")
  if not l_0_8 then
    l_0_8 = ""
    local l_0_1, l_0_2 = nil
  end
  do
    do
      l_0_9 = l_0_9(l_0_8, "^(.+)%.([^%.]+)$")
      local l_0_3, l_0_4 = nil
      if l_0_3 then
        l_0_4 = contains
        local l_0_5 = nil
        l_0_5 = string
        l_0_5 = l_0_5.lower
        l_0_5 = l_0_5(l_0_3)
        local l_0_6 = nil
        local l_0_7 = nil
        l_0_7 = "exe"
        l_0_4, l_0_6 = l_0_4(l_0_5, l_0_6), {l_0_7, "dll"}
      end
      if not l_0_4 then
        l_0_4 = mp
        l_0_4 = l_0_4.CLEAN
        return l_0_4
      end
      if not l_0_0 then
        l_0_8 = mp
        l_0_8 = l_0_8.CLEAN
        return l_0_8
      end
      l_0_8 = bm
      l_0_8 = l_0_8.get_process_relationships
      l_0_8 = l_0_8()
      local l_0_10, l_0_11 = nil
      if l_0_8 then
        l_0_10 = ipairs
        l_0_11 = l_0_8
        l_0_10 = l_0_10(l_0_11)
        for l_0_15,l_0_16 in l_0_10 do
          local l_0_15, l_0_16 = nil
          l_0_15 = l_0_14.reason
          l_0_16 = bm
          l_0_16 = l_0_16.RELATIONSHIP_INJECTION
          if l_0_15 == l_0_16 then
            l_0_15 = bm
            l_0_15 = l_0_15.add_related_string
            l_0_16 = "InjectedBy"
            l_0_15(l_0_16, l_0_14.image_path or "", bm.RelatedStringBMReport)
            l_0_15 = bm
            l_0_15 = l_0_15.add_related_string
            l_0_16 = "File_Created"
            l_0_15(l_0_16, l_0_0, bm.RelatedStringBMReport)
            l_0_15 = mp
            l_0_15 = l_0_15.INFECTED
            return l_0_15
          end
        end
      end
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC78: Confused about usage of register R4 for local variables in 'ReleaseLocals'

      end
    end
  end
end

