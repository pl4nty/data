-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\16f_1735.luac 

-- params : ...
-- function num : 0
local l_0_7, l_0_9, l_0_12, l_0_14, l_0_17, l_0_19, l_0_22, l_0_23, l_0_24, l_0_25 = nil, nil, nil, nil, nil
do
  if (this_sigattrlog[1]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3 = (string.lower)((this_sigattrlog[1]).utf8p1)
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_4 = nil
    local l_0_5 = (string.gsub)(l_0_0, ".dll", ".0.vb")
    local l_0_6 = (string.gsub)(l_0_4, ".dll", ".0.cs")
    if (sysio.IsFileExists)(l_0_5) and ((sysio.GetFileSize)(l_0_5) <= 8192 or not 8192) then
      local l_0_11 = (string.gsub)(l_0_4, ".dll", ".0.js")
    else
      do
        if (sysio.IsFileExists)(l_0_6) and ((sysio.GetFileSize)(l_0_6) <= 8192 or not 8192) then
          local l_0_16 = nil
          -- DECOMPILER ERROR at PC93: Overwrote pending register: R4 in 'AssignReg'

        else
          do
            -- DECOMPILER ERROR at PC97: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC103: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC113: Confused about usage of register: R3 in 'UnsetPending'

            do
              if (sysio.IsFileExists)(l_0_16) and ((sysio.GetFileSize)(l_0_16) <= 12288 or not 12288) then
                local l_0_21 = nil
                -- DECOMPILER ERROR at PC123: Overwrote pending register: R4 in 'AssignReg'

              end
              -- DECOMPILER ERROR at PC135: Confused about usage of register: R4 in 'UnsetPending'

              -- DECOMPILER ERROR at PC141: Confused about usage of register: R4 in 'UnsetPending'

              if (string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_5, 0, (sysio.GetFileSize)(l_0_5))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\") and (sysio.IsFileExists)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_5, 0, (sysio.GetFileSize)(l_0_5))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\")) then
                local l_0_26 = nil
                local l_0_27 = nil
                if (string.find)("|.asp|aspx|ashx|asmx|", (string.sub)((string.gsub)((string.match)(tostring((sysio.ReadFile)(l_0_5, 0, (sysio.GetFileSize)(l_0_5))), "#ExternalChecksum%(\"([^\"]+)"), "\\\\", "\\"), -4), 1, true) ~= nil and ((sysio.GetFileSize)(l_0_27) <= 512 or not 512) then
                  local l_0_30 = nil
                  local l_0_31, l_0_32 = nil
                  if (MpCommon.StringRegExpSearch)("(?i)(CodeBehind=\"|Inherits=\"|<%@ Register|CodeFile=\"|MasterPageFile=\"|WORKFLOW AUTOMATICALLY GENERATED SERVER CODE|UEditorHandler|PK\\x03\\x04)", tostring((sysio.ReadFile)(l_0_27, 0, (sysio.GetFileSize)(l_0_27)))) then
                    return mp.CLEAN
                  end
                  local l_0_33 = nil
                  if (string.match)(l_0_27, "(.*\\)[^\\]+$") then
                    (bm.add_related_string)("webshellpaths", (string.match)(l_0_27, "(.*\\)[^\\]+$"), bm.RelatedStringBMReport)
                  end
                  ;
                  (mp.ReportLowfi)(l_0_27, 2156904378)
                  ;
                  (mp.ReportLowfi)(l_0_4, 630796932)
                  ;
                  (bm.add_threat_file)(l_0_27)
                  ;
                  (bm.add_threat_file)(l_0_4)
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

