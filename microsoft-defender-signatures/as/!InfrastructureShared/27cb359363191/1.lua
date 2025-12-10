-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\27cb359363191\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
-- DECOMPILER ERROR at PC7: Overwrote pending register: R2 in 'AssignReg'

if (this_sigattrlog[12]).matched then
  local l_0_2, l_0_24, l_0_32, l_0_36, l_0_39, l_0_42 = , nil
  l_0_36, l_0_39 = l_0_32:match, l_0_32
  l_0_42 = "([^\\]+)$"
  l_0_36 = l_0_36(l_0_39, l_0_42)
  if not l_0_36 then
    l_0_36 = ""
    local l_0_3, l_0_4 = nil
  end
  do
    do
      l_0_39, l_0_42 = l_0_36:match, l_0_36
      l_0_39 = l_0_39(l_0_42, "^(.+)%.([^%.]+)$")
      local l_0_5, l_0_6 = nil
      if l_0_42 then
        l_0_5 = contains
        local l_0_7 = nil
        l_0_6 = string
        l_0_6 = l_0_6.lower
        l_0_7 = 
        l_0_6 = l_0_6(l_0_7)
        local l_0_8 = nil
        local l_0_9 = nil
        l_0_8 = "exe"
        l_0_9 = "dll"
        l_0_5, l_0_7 = l_0_5(l_0_6, l_0_7), {l_0_8, l_0_9}
      end
      if not l_0_5 then
        l_0_5 = mp
        l_0_5 = l_0_5.CLEAN
        return l_0_5
      end
      if (this_sigattrlog[3]).matched then
        l_0_24 = (this_sigattrlog[3]).utf8p2
        local l_0_11 = nil
        l_0_11 = this_sigattrlog
        l_0_11 = l_0_11[3]
        l_0_2 = l_0_11.utf8p1
        local l_0_10 = nil
      end
      do
        if (this_sigattrlog[4]).matched then
          l_0_24 = (this_sigattrlog[4]).utf8p2
          l_0_2 = (this_sigattrlog[4]).utf8p1
          local l_0_12, l_0_13 = nil
        end
        do
          if (this_sigattrlog[5]).matched then
            l_0_24 = (this_sigattrlog[5]).utf8p2
            local l_0_14 = nil
            l_0_14 = this_sigattrlog
            l_0_14 = l_0_14[5]
            l_0_2 = l_0_14.utf8p1
          end
          do
            if (this_sigattrlog[6]).matched then
              l_0_24 = (this_sigattrlog[6]).utf8p2
              l_0_2 = (this_sigattrlog[6]).utf8p1
              local l_0_15, l_0_16 = nil
            end
            do
              if (this_sigattrlog[7]).matched then
                l_0_24 = (this_sigattrlog[7]).utf8p2
                local l_0_17 = nil
                l_0_17 = this_sigattrlog
                l_0_17 = l_0_17[7]
                l_0_2 = l_0_17.utf8p1
              end
              do
                if (this_sigattrlog[8]).matched then
                  l_0_24 = (this_sigattrlog[8]).utf8p2
                  l_0_2 = (this_sigattrlog[8]).utf8p1
                  local l_0_18, l_0_19 = nil
                end
                do
                  if (this_sigattrlog[9]).matched then
                    l_0_24 = (this_sigattrlog[9]).utf8p2
                    local l_0_20 = nil
                    l_0_20 = this_sigattrlog
                    l_0_20 = l_0_20[9]
                    l_0_2 = l_0_20.utf8p1
                  end
                  do
                    if (this_sigattrlog[10]).matched then
                      l_0_24 = (this_sigattrlog[10]).utf8p2
                      l_0_2 = (this_sigattrlog[10]).utf8p1
                      local l_0_21, l_0_22, l_0_25, l_0_27, l_0_28, l_0_30, l_0_33, l_0_34, l_0_37, l_0_40 = nil
                    end
                    do
                      if (this_sigattrlog[11]).matched then
                        l_0_24 = (this_sigattrlog[11]).utf8p2
                        local l_0_23, l_0_26, l_0_29, l_0_31, l_0_35, l_0_38, l_0_41 = nil
                        l_0_23 = this_sigattrlog
                        l_0_23 = l_0_23[11]
                        l_0_2 = l_0_23.utf8p1
                      end
                      do
                        if not l_0_32 or not l_0_24 or not l_0_2 then
                          return mp.CLEAN
                        end
                        ;
                        (bm.add_related_string)("InjectionType", l_0_24, bm.RelatedStringBMReport)
                        ;
                        (bm.add_related_string)("InjectedIn", l_0_2, bm.RelatedStringBMReport)
                        ;
                        (bm.add_related_string)("File_Created", l_0_32, bm.RelatedStringBMReport)
                        return mp.INFECTED
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

