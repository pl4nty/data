local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1
L0_1 = mp
L0_1 = L0_1.get_sigattr_event_count
L1_1 = 16525
L0_1 = L0_1(L1_1)
if not (L0_1 < 10) then
  L0_1 = mp
  L0_1 = L0_1.get_sigattr_event_count
  L1_1 = 16387
  L0_1 = L0_1(L1_1)
  if L0_1 < 10 then
    L0_1 = mp
    L0_1 = L0_1.get_sigattr_event_count
    L1_1 = 16385
    L0_1 = L0_1(L1_1)
    if L0_1 < 9 then
      goto lbl_37
    end
  end
  L0_1 = mp
  L0_1 = L0_1.get_sigattr_event_count
  L1_1 = 16384
  L0_1 = L0_1(L1_1)
  if L0_1 < 10 then
    L0_1 = mp
    L0_1 = L0_1.get_sigattr_event_count
    L1_1 = 16386
    L0_1 = L0_1(L1_1)
    if L0_1 < 10 then
      goto lbl_37
    end
  end
  L0_1 = mp
  L0_1 = L0_1.get_sigattr_event_count
  L1_1 = 16389
  L0_1 = L0_1(L1_1)
  if not (L0_1 < 10) then
    goto lbl_40
  end
end
::lbl_37::
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_40::

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L1_2 = MpCommon
  L1_2 = L1_2.ExpandEnvironmentVariables
  L2_2 = "%ProgramFiles%"
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.lower
  L1_2 = L1_2(L2_2)
  L2_2 = MpCommon
  L2_2 = L2_2.ExpandEnvironmentVariables
  L3_2 = "%ProgramFiles(x86)%"
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.lower
  L2_2 = L2_2(L3_2)
  L3_2 = MpCommon
  L3_2 = L3_2.ExpandEnvironmentVariables
  L4_2 = "%windir%"
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.lower
  L3_2 = L3_2(L4_2)
  L4_2 = mp
  L4_2 = L4_2.ContextualExpandEnvironmentVariables
  L5_2 = "%APPDATA%"
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2
  L4_2 = L4_2.lower
  L4_2 = L4_2(L5_2)
  L5_2 = mp
  L5_2 = L5_2.ContextualExpandEnvironmentVariables
  L6_2 = "%LOCALAPPDATA%"
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2
  L5_2 = L5_2.lower
  L5_2 = L5_2(L6_2)
  L6_2 = MpCommon
  L6_2 = L6_2.ExpandEnvironmentVariables
  L7_2 = "%ProgramData%"
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2
  L6_2 = L6_2.lower
  L6_2 = L6_2(L7_2)
  L7_2 = MpCommon
  L7_2 = L7_2.ExpandEnvironmentVariables
  L8_2 = "%PUBLIC%"
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2
  L7_2 = L7_2.lower
  L7_2 = L7_2(L8_2)
  L8_2 = MpCommon
  L8_2 = L8_2.ExpandEnvironmentVariables
  L9_2 = "system"
  L8_2 = L8_2(L9_2)
  L9_2 = L8_2
  L8_2 = L8_2.lower
  L8_2, L9_2 = L8_2(L9_2)
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
  L0_2[9] = L9_2
  return L0_2
end

L1_1 = 90
L2_1 = 1000
L3_1 = 0
L4_1 = 0
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = 0
L9_1 = bm
L9_1 = L9_1.get_current_process_startup_info
L9_1 = L9_1()
L10_1 = L9_1.ppid
L11_1 = bm
L11_1 = L11_1.get_imagepath
L11_1 = L11_1()
L12_1 = L11_1
L11_1 = L11_1.lower
L11_1 = L11_1(L12_1)
L12_1 = {}
L13_1 = {}
L14_1 = {}
L15_1 = {}
L16_1 = "DafrRQ"
L17_1 = L10_1
L18_1 = "SeqRead:"
L17_1 = L17_1 .. L18_1
L18_1 = L10_1
L19_1 = "DelFile:"
L18_1 = L18_1 .. L19_1
L19_1 = L10_1
L20_1 = "CrtFile:"
L19_1 = L19_1 .. L20_1
L20_1 = L10_1
L21_1 = "RenFile:"
L20_1 = L20_1 .. L21_1
L21_1 = L10_1
L22_1 = "ChgFile:"
L21_1 = L21_1 .. L22_1
L22_1 = L10_1
L23_1 = "MetFile:"
L22_1 = L22_1 .. L23_1
L23_1 = L10_1
L24_1 = "Threshold:"
L23_1 = L23_1 .. L24_1
L24_1 = L10_1
L25_1 = "Timing:"
L24_1 = L24_1 .. L25_1
L25_1 = 1
L26_1 = mp
L26_1 = L26_1.SIGATTR_LOG_SZ
L27_1 = 1
for L28_1 = L25_1, L26_1, L27_1 do
  L29_1 = sigattr_tail
  L29_1 = L29_1[L28_1]
  L29_1 = L29_1.attribute
  if L29_1 ~= 16525 then
    L29_1 = sigattr_tail
    L29_1 = L29_1[L28_1]
    L29_1 = L29_1.attribute
    if L29_1 ~= 16387 then
      L29_1 = sigattr_tail
      L29_1 = L29_1[L28_1]
      L29_1 = L29_1.attribute
      if L29_1 ~= 16384 then
        L29_1 = sigattr_tail
        L29_1 = L29_1[L28_1]
        L29_1 = L29_1.attribute
        if L29_1 ~= 16385 then
          L29_1 = sigattr_tail
          L29_1 = L29_1[L28_1]
          L29_1 = L29_1.attribute
          if L29_1 ~= 16386 then
            L29_1 = sigattr_tail
            L29_1 = L29_1[L28_1]
            L29_1 = L29_1.attribute
            if L29_1 ~= 16389 then
              goto lbl_633
            end
            L29_1 = sigattr_tail
            L29_1 = L29_1[L28_1]
            L29_1 = L29_1.utf8p2
            L30_1 = L29_1
            L29_1 = L29_1.lower
            L29_1 = L29_1(L30_1)
            if L29_1 ~= "attr_c09458eb" then
              goto lbl_633
            end
          end
        end
      end
    end
  end
  L29_1 = sigattr_tail
  L29_1 = L29_1[L28_1]
  L29_1 = L29_1.utf8p1
  L30_1 = L29_1
  L29_1 = L29_1.lower
  L29_1 = L29_1(L30_1)
  L31_1 = L29_1
  L30_1 = L29_1.match
  L32_1 = "(.+)[/\\].+"
  L30_1 = L30_1(L31_1, L32_1)
  L31_1 = false
  L32_1 = "%.[^%.%\\]+$"
  L34_1 = L29_1
  L33_1 = L29_1.byte
  L35_1 = 1
  L33_1 = L33_1(L34_1, L35_1)
  if L33_1 == 37 or L30_1 == "" or L30_1 == nil then
    L31_1 = true
  end
  if not L31_1 then
    L33_1 = next
    L34_1 = L12_1
    L33_1 = L33_1(L34_1)
    if L33_1 == nil then
      L33_1 = L0_1
      L33_1 = L33_1()
      L12_1 = L33_1
    end
    L33_1 = ipairs
    L34_1 = L12_1
    L33_1, L34_1, L35_1 = L33_1(L34_1)
    for L36_1, L37_1 in L33_1, L34_1, L35_1 do
      L39_1 = L29_1
      L38_1 = L29_1.find
      L40_1 = L37_1
      L38_1 = L38_1(L39_1, L40_1)
      if L38_1 then
        L31_1 = true
        break
      end
    end
  end
  
  function L33_1(A0_2)
    local L1_2, L2_2, L3_2
    L2_2 = A0_2
    L1_2 = A0_2.match
    L3_2 = L32_1
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 ~= nil then
      L3_2 = L1_2
      L2_2 = L1_2.lower
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
      L2_2 = mp
      L2_2 = L2_2.GetExtensionClass
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      if L2_2 == 1 or L2_2 == 4 or L2_2 == 0 then
        L3_2 = false
        return L3_2
      else
        L3_2 = true
        return L3_2
      end
    else
      L2_2 = false
      return L2_2
    end
  end
  
  if not L31_1 then
    L34_1 = sigattr_tail
    L34_1 = L34_1[L28_1]
    L34_1 = L34_1.attribute
    if L34_1 == 16525 then
      L3_1 = L3_1 + 1
      L34_1 = L17_1
      L35_1 = L29_1
      L34_1 = L34_1 .. L35_1
      L14_1[L34_1] = L30_1
    else
      L34_1 = sigattr_tail
      L34_1 = L34_1[L28_1]
      L34_1 = L34_1.attribute
      if L34_1 == 16387 then
        L34_1 = L33_1
        L35_1 = L29_1
        L34_1 = L34_1(L35_1)
        if L34_1 then
          L4_1 = L4_1 + 1
          L34_1 = L18_1
          L35_1 = L29_1
          L34_1 = L34_1 .. L35_1
          L14_1[L34_1] = L30_1
        end
      else
        L34_1 = sigattr_tail
        L34_1 = L34_1[L28_1]
        L34_1 = L34_1.attribute
        if L34_1 == 16384 then
          L5_1 = L5_1 + 1
          L34_1 = L19_1
          L35_1 = L29_1
          L34_1 = L34_1 .. L35_1
          L14_1[L34_1] = L30_1
        else
          L34_1 = sigattr_tail
          L34_1 = L34_1[L28_1]
          L34_1 = L34_1.attribute
          if L34_1 == 16386 then
            L34_1 = sigattr_tail
            L34_1 = L34_1[L28_1]
            L34_1 = L34_1.utf8p2
            L35_1 = L34_1
            L34_1 = L34_1.lower
            L34_1 = L34_1(L35_1)
            L35_1 = L33_1
            L36_1 = L34_1
            L35_1 = L35_1(L36_1)
            if L35_1 then
              L6_1 = L6_1 + 1
              L35_1 = L20_1
              L36_1 = L34_1
              L35_1 = L35_1 .. L36_1
              L14_1[L35_1] = L29_1
            end
          else
            L34_1 = sigattr_tail
            L34_1 = L34_1[L28_1]
            L34_1 = L34_1.attribute
            if L34_1 == 16385 then
              L7_1 = L7_1 + 1
              L34_1 = L21_1
              L35_1 = L29_1
              L34_1 = L34_1 .. L35_1
              L35_1 = sigattr_tail
              L35_1 = L35_1[L28_1]
              L35_1 = L35_1.utf8p2
              L36_1 = L35_1
              L35_1 = L35_1.lower
              L35_1 = L35_1(L36_1)
              L14_1[L34_1] = L35_1
            else
              L34_1 = sigattr_tail
              L34_1 = L34_1[L28_1]
              L34_1 = L34_1.attribute
              if L34_1 == 16389 then
                L8_1 = L8_1 + 1
                L34_1 = L22_1
                L35_1 = L29_1
                L34_1 = L34_1 .. L35_1
                L35_1 = sigattr_tail
                L35_1 = L35_1[L28_1]
                L35_1 = L35_1.utf8p2
                L36_1 = L35_1
                L35_1 = L35_1.lower
                L35_1 = L35_1(L36_1)
                L14_1[L34_1] = L35_1
              end
            end
          end
        end
      end
    end
    if 10 <= L3_1 and (10 <= L4_1 or 10 <= L7_1) and (10 <= L5_1 or 10 <= L6_1) and 10 <= L8_1 then
      L34_1 = pairs
      L35_1 = L14_1
      L34_1, L35_1, L36_1 = L34_1(L35_1)
      for L37_1 in L34_1, L35_1, L36_1 do
        L38_1 = string
        L38_1 = L38_1.format
        L39_1 = "%s"
        L40_1 = L37_1
        L38_1 = L38_1(L39_1, L40_1)
        L39_1 = string
        L39_1 = L39_1.sub
        L40_1 = L38_1
        L41_1 = 1
        L42_1 = #L17_1
        L39_1 = L39_1(L40_1, L41_1, L42_1)
        if L39_1 == L17_1 then
          L39_1 = table
          L39_1 = L39_1.insert
          L40_1 = L15_1
          L41_1 = string
          L41_1 = L41_1.sub
          L42_1 = L38_1
          L43_1 = #L17_1
          L43_1 = L43_1 + 1
          L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1 = L41_1(L42_1, L43_1)
          L39_1(L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1)
        end
      end
      L34_1 = pairs
      L35_1 = L15_1
      L34_1, L35_1, L36_1 = L34_1(L35_1)
      for L37_1, L38_1 in L34_1, L35_1, L36_1 do
        L39_1 = string
        L39_1 = L39_1.match
        L40_1 = L38_1
        L41_1 = "[^\\]+$"
        L39_1 = L39_1(L40_1, L41_1)
        L40_1 = L17_1
        L41_1 = L38_1
        L40_1 = L40_1 .. L41_1
        L40_1 = L14_1[L40_1]
        L41_1 = L40_1
        L42_1 = "\\.*\\"
        L43_1 = L39_1
        L41_1 = L41_1 .. L42_1 .. L43_1
        if 0 < L4_1 then
          L42_1 = L18_1
          L43_1 = L38_1
          L42_1 = L42_1 .. L43_1
          L42_1 = L14_1[L42_1]
          if L42_1 then
            goto lbl_333
          end
        end
        L42_1 = false
        ::lbl_333::
        L43_1 = nil
        if 0 < L6_1 then
          L44_1 = nil
          L45_1 = L20_1
          L46_1 = L38_1
          L45_1 = L45_1 .. L46_1
          L43_1 = L14_1[L45_1]
          if L43_1 then
            L45_1 = tostring
            L46_1 = L43_1
            L45_1 = L45_1(L46_1)
            L46_1 = L45_1
            L45_1 = L45_1.lower
            L45_1 = L45_1(L46_1)
            L46_1 = L45_1
            L45_1 = L45_1.gsub
            L47_1 = "(:\\users)\\[%w._@']+"
            L48_1 = "%1\\PII_"
            L45_1 = L45_1(L46_1, L47_1, L48_1)
            L44_1 = L45_1
            L45_1 = table
            L45_1 = L45_1.insert
            L46_1 = L13_1
            L47_1 = "RenamedTo:"
            L48_1 = L44_1
            L47_1 = L47_1 .. L48_1
            L45_1(L46_1, L47_1)
          else
            L46_1 = L38_1
            L45_1 = L38_1.match
            L47_1 = "(.*)%.%w+$"
            L45_1 = L45_1(L46_1, L47_1)
            L46_1 = L20_1
            L47_1 = L45_1
            L46_1 = L46_1 .. L47_1
            L46_1 = L14_1[L46_1]
            L43_1 = L46_1 == L38_1
            if L43_1 then
              L47_1 = tostring
              L48_1 = L45_1
              L47_1 = L47_1(L48_1)
              L48_1 = L47_1
              L47_1 = L47_1.lower
              L47_1 = L47_1(L48_1)
              L48_1 = L47_1
              L47_1 = L47_1.gsub
              L49_1 = "(:\\users)\\[%w._@']+"
              L50_1 = "%1\\PII_"
              L47_1 = L47_1(L48_1, L49_1, L50_1)
              L44_1 = L47_1
              L47_1 = table
              L47_1 = L47_1.insert
              L48_1 = L13_1
              L49_1 = "RenamedFrom:"
              L50_1 = L44_1
              L49_1 = L49_1 .. L50_1
              L47_1(L48_1, L49_1)
            end
          end
        end
        if 0 < L7_1 then
          L44_1 = L21_1
          L45_1 = L38_1
          L44_1 = L44_1 .. L45_1
          L44_1 = L14_1[L44_1]
          if L44_1 then
            goto lbl_400
          end
        end
        L44_1 = false
        ::lbl_400::
        
        function L45_1(A0_2, A1_2)
          local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
          L2_2 = string
          L2_2 = L2_2.gsub
          L3_2 = A1_2
          L4_2 = "%?"
          L5_2 = "."
          L2_2 = L2_2(L3_2, L4_2, L5_2)
          A1_2 = L2_2
          L2_2 = string
          L2_2 = L2_2.gsub
          L3_2 = A1_2
          L4_2 = "%-"
          L5_2 = "%%-"
          L2_2 = L2_2(L3_2, L4_2, L5_2)
          A1_2 = L2_2
          L2_2 = pairs
          L3_2 = A0_2
          L2_2, L3_2, L4_2 = L2_2(L3_2)
          for L5_2 in L2_2, L3_2, L4_2 do
            L6_2 = string
            L6_2 = L6_2.find
            L7_2 = L5_2
            L8_2 = A1_2
            L9_2 = 1
            L10_2 = false
            L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
            if L6_2 then
              return L5_2
            end
          end
          L2_2 = nil
          return L2_2
        end
        
        L46_1 = nil
        if 0 < L5_1 then
          L47_1 = L45_1
          L48_1 = L14_1
          L49_1 = L19_1
          L50_1 = L38_1
          L49_1 = L49_1 .. L50_1
          L47_1 = L47_1(L48_1, L49_1)
          L46_1 = L47_1
          if not L46_1 then
            L47_1 = L45_1
            L48_1 = L14_1
            L49_1 = L19_1
            L50_1 = L41_1
            L49_1 = L49_1 .. L50_1
            L47_1 = L47_1(L48_1, L49_1)
            L46_1 = L47_1
          end
          if L46_1 then
            L47_1 = tostring
            L48_1 = L46_1
            L47_1 = L47_1(L48_1)
            L48_1 = L47_1
            L47_1 = L47_1.lower
            L47_1 = L47_1(L48_1)
            L48_1 = L47_1
            L47_1 = L47_1.gsub
            L49_1 = "(:\\users)\\[%w._@']+"
            L50_1 = "%1\\PII_"
            L47_1 = L47_1(L48_1, L49_1, L50_1)
            L48_1 = table
            L48_1 = L48_1.insert
            L49_1 = L13_1
            L50_1 = "Created:"
            L52_1 = L47_1
            L51_1 = L47_1.sub
            L53_1 = #L19_1
            L53_1 = L53_1 + 1
            L51_1 = L51_1(L52_1, L53_1)
            L50_1 = L50_1 .. L51_1
            L48_1(L49_1, L50_1)
          end
        end
        L47_1 = L45_1
        L48_1 = L14_1
        L49_1 = L22_1
        L50_1 = L38_1
        L49_1 = L49_1 .. L50_1
        L47_1 = L47_1(L48_1, L49_1)
        if not L47_1 then
          L47_1 = L45_1
          L48_1 = L14_1
          L49_1 = L22_1
          L50_1 = L41_1
          L49_1 = L49_1 .. L50_1
          L47_1 = L47_1(L48_1, L49_1)
        end
        if L47_1 and (L42_1 and L46_1 or L43_1 and L44_1) then
          if L42_1 and L46_1 then
            L48_1 = "_CreateDelete_"
            if L48_1 then
              goto lbl_473
            end
          end
          L48_1 = "_RenameChange_"
          ::lbl_473::
          L49_1 = IsKeyInRollingQueue
          L50_1 = L16_1
          L51_1 = L23_1
          L52_1 = L48_1
          L51_1 = L51_1 .. L52_1
          L49_1 = L49_1(L50_1, L51_1)
          if not L49_1 then
            L49_1 = AppendToRollingQueue
            L50_1 = L16_1
            L51_1 = L23_1
            L52_1 = L48_1
            L51_1 = L51_1 .. L52_1
            L52_1 = 1
            L53_1 = L1_1
            L54_1 = L2_1
            L49_1(L50_1, L51_1, L52_1, L53_1, L54_1)
            L49_1 = AppendToRollingQueue
            L50_1 = L16_1
            L51_1 = L24_1
            L52_1 = L48_1
            L51_1 = L51_1 .. L52_1
            L52_1 = MpCommon
            L52_1 = L52_1.GetCurrentTimeT
            L52_1 = L52_1()
            if not L52_1 then
              L52_1 = -1
            end
            L53_1 = L1_1
            L54_1 = L2_1
            L49_1(L50_1, L51_1, L52_1, L53_1, L54_1)
          else
            L49_1 = tonumber
            L50_1 = GetRollingQueueKeyValue
            L51_1 = L16_1
            L52_1 = L24_1
            L53_1 = L48_1
            L52_1 = L52_1 .. L53_1
            L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1 = L50_1(L51_1, L52_1)
            L49_1 = L49_1(L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1)
            if not L49_1 then
              L49_1 = -1
            end
            L50_1 = MpCommon
            L50_1 = L50_1.GetCurrentTimeT
            L50_1 = L50_1()
            if not L50_1 then
              L50_1 = -2
            end
            L51_1 = L50_1 - L49_1
            if L51_1 < 0 or 90 < L51_1 then
              L52_1 = AppendToRollingQueue
              L53_1 = L16_1
              L54_1 = L23_1
              L55_1 = L48_1
              L54_1 = L54_1 .. L55_1
              L55_1 = 1
              L56_1 = L1_1
              L57_1 = L2_1
              L52_1(L53_1, L54_1, L55_1, L56_1, L57_1)
              L52_1 = AppendToRollingQueue
              L53_1 = L16_1
              L54_1 = L24_1
              L55_1 = L48_1
              L54_1 = L54_1 .. L55_1
              L55_1 = MpCommon
              L55_1 = L55_1.GetCurrentTimeT
              L55_1 = L55_1()
              if not L55_1 then
                L55_1 = -1
              end
              L56_1 = L1_1
              L57_1 = L2_1
              L52_1(L53_1, L54_1, L55_1, L56_1, L57_1)
              L52_1 = mp
              L52_1 = L52_1.CLEAN
              return L52_1
            end
            L52_1 = tonumber
            L53_1 = GetRollingQueueKeyValue
            L54_1 = L16_1
            L55_1 = L23_1
            L56_1 = L48_1
            L55_1 = L55_1 .. L56_1
            L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1 = L53_1(L54_1, L55_1)
            L52_1 = L52_1(L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1)
            if 10 <= L52_1 then
              L53_1 = bm
              L53_1 = L53_1.trigger_sig
              L54_1 = "GenericRansomware"
              L55_1 = "Type0"
              L53_1(L54_1, L55_1)
              L53_1 = {}
              L54_1 = pairs
              L55_1 = L15_1
              L54_1, L55_1, L56_1 = L54_1(L55_1)
              for L57_1, L58_1 in L54_1, L55_1, L56_1 do
                L59_1 = string
                L59_1 = L59_1.gsub
                L61_1 = L58_1
                L60_1 = L58_1.lower
                L60_1 = L60_1(L61_1)
                L61_1 = "(:\\users)\\[%w._@']+"
                L62_1 = "%1\\PII_"
                L59_1 = L59_1(L60_1, L61_1, L62_1)
                L60_1 = table
                L60_1 = L60_1.insert
                L61_1 = L53_1
                L62_1 = L59_1
                L60_1(L61_1, L62_1)
              end
              L54_1 = {}
              L54_1.ThresholdValue = L52_1
              L54_1.HeurType = L48_1
              L54_1.CountStartTime = L49_1
              L54_1.CountEndTime = L50_1
              L54_1.DeletedFileCount = L4_1
              L54_1.CreatedFileCount = L5_1
              L54_1.RenamedFileCount = L6_1
              L54_1.ChangedFileCount = L7_1
              L54_1.TamperedFiles = L53_1
              L54_1.CreatedRenamed = L13_1
              L54_1.ImagePath = L11_1
              L55_1 = bm
              L55_1 = L55_1.get_sig_count
              L55_1 = L55_1()
              L54_1.BMHitCount = L55_1
              L55_1 = safeJsonSerialize
              L56_1 = L54_1
              L55_1 = L55_1(L56_1)
              L56_1 = reportSessionInformationInclusive
              L56_1()
              L56_1 = bm
              L56_1 = L56_1.add_related_string
              L57_1 = "GenericRansomware"
              L58_1 = L55_1
              L59_1 = bm
              L59_1 = L59_1.RelatedStringBMReport
              L56_1(L57_1, L58_1, L59_1)
              L56_1 = reportTimingData
              L56_1()
              L56_1 = mp
              L56_1 = L56_1.INFECTED
              return L56_1
            else
              L53_1 = AppendToRollingQueue
              L54_1 = L16_1
              L55_1 = L23_1
              L56_1 = L48_1
              L55_1 = L55_1 .. L56_1
              L56_1 = L52_1 + 1
              L57_1 = L1_1
              L58_1 = L2_1
              L53_1(L54_1, L55_1, L56_1, L57_1, L58_1)
            end
          end
        end
      end
    end
  end
  ::lbl_633::
end
L25_1 = mp
L25_1 = L25_1.CLEAN
return L25_1
