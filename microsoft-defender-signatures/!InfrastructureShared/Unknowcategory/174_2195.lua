-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\174_2195.luac 

-- params : ...
-- function num : 0
local l_0_4, l_0_10, l_0_16, l_0_41, l_0_48, l_0_64, l_0_71, l_0_91, l_0_98, l_0_106, l_0_111, l_0_116, l_0_121 = nil, nil, nil, nil, nil, nil
if (this_sigattrlog[1]).matched then
  local l_0_0, l_0_6, l_0_12, l_0_18, l_0_22 = (string.lower)((this_sigattrlog[1]).utf8p1)
else
  do
    if (this_sigattrlog[2]).matched then
      local l_0_1, l_0_7, l_0_13, l_0_19, l_0_23, l_0_27 = , (string.lower)((this_sigattrlog[2]).utf8p1)
    else
      do
        if (this_sigattrlog[3]).matched then
          local l_0_2, l_0_8, l_0_14, l_0_20, l_0_24, l_0_28, l_0_31 = , (string.lower)((this_sigattrlog[3]).utf8p1)
        else
          do
            if (this_sigattrlog[4]).matched then
              local l_0_3, l_0_9, l_0_15, l_0_21, l_0_25, l_0_29, l_0_32, l_0_40, l_0_47, l_0_63, l_0_70, l_0_90, l_0_97, l_0_105, l_0_110, l_0_115, l_0_120 = , (string.lower)((this_sigattrlog[4]).utf8p1)
            else
              do
                if (this_sigattrlog[5]).matched then
                  local l_0_5 = nil
                  l_0_5 = (string.gsub)((string.lower)((this_sigattrlog[5]).utf8p1), ".1.vb", ".0.vb")
                else
                  do
                    if (this_sigattrlog[6]).matched then
                      local l_0_11 = nil
                    else
                      do
                        do
                          if (this_sigattrlog[7]).matched then
                            local l_0_17, l_0_42, l_0_49, l_0_65, l_0_72, l_0_92, l_0_99, l_0_122 = , (string.gsub)((string.lower)((this_sigattrlog[6]).utf8p1), ".1.cs", ".0.cs"), (string.lower)((this_sigattrlog[7]).utf8p1)
                            l_0_99 = string
                            l_0_99 = l_0_99.gsub
                            l_0_122 = l_0_92
                            l_0_99 = l_0_99(l_0_122, ".1.js", ".0.js")
                            l_0_49 = l_0_99
                          end
                          -- DECOMPILER ERROR at PC111: Confused about usage of register: R3 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC115: Confused about usage of register: R3 in 'UnsetPending'

                          if l_0_65 ~= nil then
                            local l_0_26, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_44, l_0_52, l_0_54, l_0_56, l_0_58, l_0_60, l_0_67, l_0_75, l_0_78, l_0_81, l_0_84, l_0_87, l_0_94, l_0_102, l_0_107, l_0_112, l_0_117 = (string.gsub)(l_0_65, ".dll", ".0.vb")
                            l_0_44 = string
                            l_0_44 = l_0_44.gsub
                            l_0_52 = l_0_35
                            l_0_54 = ".dll"
                            l_0_56 = ".0.cs"
                            l_0_44 = l_0_44(l_0_52, l_0_54, l_0_56)
                            l_0_33 = l_0_44
                            local l_0_30, l_0_38, l_0_45, l_0_53, l_0_55, l_0_57, l_0_59, l_0_61, l_0_68, l_0_76, l_0_79, l_0_82, l_0_85, l_0_88, l_0_95, l_0_103, l_0_108, l_0_113, l_0_118 = nil
                            l_0_44 = string
                            l_0_44 = l_0_44.gsub
                            l_0_52 = l_0_35
                            l_0_54 = ".dll"
                            l_0_56 = ".0.js"
                            l_0_44 = l_0_44(l_0_52, l_0_54, l_0_56)
                            l_0_34 = l_0_44
                            local l_0_39, l_0_46, l_0_62, l_0_69, l_0_77, l_0_80, l_0_83, l_0_86, l_0_89, l_0_96, l_0_104, l_0_109, l_0_114, l_0_119 = nil
                          end
                          do
                            -- DECOMPILER ERROR at PC134: Confused about usage of register: R0 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

                            if l_0_26 ~= nil and (sysio.IsFileExists)(l_0_26) and ((sysio.GetFileSize)(l_0_26) <= 8192 or not 8192) then
                              local l_0_51 = nil
                            else
                              do
                                -- DECOMPILER ERROR at PC166: Confused about usage of register: R1 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC170: Confused about usage of register: R1 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC176: Confused about usage of register: R1 in 'UnsetPending'

                                -- DECOMPILER ERROR at PC186: Confused about usage of register: R1 in 'UnsetPending'

                                if l_0_33 ~= nil and (sysio.IsFileExists)(l_0_33) and ((sysio.GetFileSize)(l_0_33) <= 8192 or not 8192) then
                                  local l_0_74 = nil
                                  -- DECOMPILER ERROR at PC196: Overwrote pending register: R4 in 'AssignReg'

                                else
                                  do
                                    -- DECOMPILER ERROR at PC198: Confused about usage of register: R2 in 'UnsetPending'

                                    -- DECOMPILER ERROR at PC202: Confused about usage of register: R2 in 'UnsetPending'

                                    -- DECOMPILER ERROR at PC208: Confused about usage of register: R2 in 'UnsetPending'

                                    -- DECOMPILER ERROR at PC218: Confused about usage of register: R2 in 'UnsetPending'

                                    do
                                      if l_0_34 ~= nil and (sysio.IsFileExists)(l_0_34) and ((sysio.GetFileSize)(l_0_34) <= 12288 or not 12288) then
                                        local l_0_101 = nil
                                        -- DECOMPILER ERROR at PC228: Overwrote pending register: R4 in 'AssignReg'

                                      end
                                      -- DECOMPILER ERROR at PC240: Confused about usage of register: R4 in 'UnsetPending'

                                      -- DECOMPILER ERROR at PC246: Confused about usage of register: R4 in 'UnsetPending'

                                      if (string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\") and (sysio.IsFileExists)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\")) then
                                        local l_0_123 = nil
                                        local l_0_124 = nil
                                        -- DECOMPILER ERROR at PC261: Confused about usage of register: R4 in 'UnsetPending'

                                        -- DECOMPILER ERROR at PC271: Confused about usage of register: R4 in 'UnsetPending'

                                        if (string.find)("|.asp|aspx|ashx|asmx|", (string.sub)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"), -4), 1, true) ~= nil and ((sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\")) <= 512 or not 512) then
                                          local l_0_127 = nil
                                          local l_0_128, l_0_129 = nil
                                          if (MpCommon.StringRegExpSearch)("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|CKEditor)", tostring((sysio.ReadFile)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"), 0, (sysio.GetFileSize)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_26, 0, (sysio.GetFileSize)(l_0_26))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"))))) then
                                            return mp.CLEAN
                                          end
                                          local l_0_130 = nil
                                          if (string.match)(l_0_129, "(.*\\)[^\\]+$") then
                                            (bm.add_related_string)("webshellpaths", (string.match)(l_0_129, "(.*\\)[^\\]+$"), bm.RelatedStringBMReport)
                                          end
                                          ;
                                          (bm.add_threat_file)(l_0_129)
                                          ;
                                          (mp.ReportLowfi)(l_0_129, 3765990157)
                                          return mp.INFECTED
                                        end
                                      end
                                      do
                                        return mp.CLEAN
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
              end
            end
          end
        end
      end
    end
  end
end

