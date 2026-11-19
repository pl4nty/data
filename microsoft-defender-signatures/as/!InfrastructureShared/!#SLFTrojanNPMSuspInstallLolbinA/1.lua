-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:NPM/SuspInstallLolbin.A
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: Implicit:FileNameEQpackage.json

-- Fallback: local variables were not recovered, registers are shown instead

local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1)
if L0_1 ~= "package.json" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
L2_1 = type
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 ~= "number" or L1_1 < 2 or 262144 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = L1_1
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
if not L2_1 or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "Lua:SuspInstallLolbinReadFailed"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tostring
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = #L4_1
if L5_1 ~= L1_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:SuspInstallLolbinPartialRead"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L4_1
L7_1 = 1
L8_1 = 3
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == "\239\187\191" then
  L5_1 = string
  L5_1 = L5_1.sub
  L6_1 = L4_1
  L7_1 = 4
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
end
L5_1 = safeJsonDeserialize
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = type
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 == "table" then
  L6_1 = type
  L7_1 = L5_1.scripts
  L6_1 = L6_1(L7_1)
  if L6_1 == "table" then
    goto lbl_99
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_99::
L6_1 = {}
L6_1.curl = true
L6_1.wget = true
L6_1.powershell = true
L6_1.pwsh = true
L6_1.certutil = true
L6_1.bitsadmin = true
L6_1.mshta = true
L6_1.msiexec = true
L6_1.rundll32 = true
L6_1.regsvr32 = true
L6_1.cscript = true
L6_1.wscript = true
L6_1.msbuild = true
L6_1.installutil = true
L6_1.regasm = true
L6_1.regsvcs = true
L6_1.wmic = true
L7_1 = {}
L7_1[";"] = true
L7_1["&"] = true
L7_1["|"] = true
L7_1["("] = true
L7_1[")"] = true
L7_1["\n"] = true
L7_1["\r"] = true
L8_1 = {}
L8_1.env = true
L8_1.nohup = true
L8_1.command = true
L8_1.exec = true
L8_1.call = true
L8_1["cross-env"] = true
L8_1["cross-env.cmd"] = true
L8_1["if"] = true
L8_1["then"] = true
L8_1["else"] = true
L8_1.elif = true
L8_1["do"] = true
L8_1["while"] = true
L8_1["until"] = true
L9_1 = {}
L9_1.cmd = true
L9_1["%comspec%"] = true
L9_1.sh = true
L9_1.bash = true
L9_1.dash = true
L9_1.zsh = true
L9_1.ksh = true
L10_1 = {}
L10_1.env = true
L10_1.nohup = true
L10_1.command = true
L10_1.exec = true
L10_1.call = true
L10_1["cross-env"] = true
L10_1["cross-env.cmd"] = true

function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if 16 < A2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = {}
  L4_2["("] = ")"
  L4_2["{"] = "}"
  L4_2["`"] = "`"
  L4_2 = L4_2[L3_2]
  if L4_2 == nil then
    L5_2 = nil
    return L5_2
  end
  L5_2 = nil
  A1_2 = A1_2 + 1
  while true do
    L6_2 = #A0_2
    if not (A1_2 <= L6_2) then
      break
    end
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = string
    L7_2 = L7_2.sub
    L8_2 = A0_2
    L9_2 = A1_2 + 1
    L10_2 = A1_2 + 1
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if L6_2 == "\\" and L5_2 ~= "'" then
      A1_2 = A1_2 + 2
    elseif L5_2 == "'" then
      if L6_2 == "'" then
        L5_2 = nil
      end
      A1_2 = A1_2 + 1
    elseif L6_2 == "`" and L4_2 == "`" then
      return A1_2
    elseif L6_2 == "`" or L6_2 == "$" and L7_2 == "(" then
      L8_2 = A1_2 or L8_2
      if L6_2 ~= "`" or not A1_2 then
        L8_2 = A1_2 + 1
      end
      L9_2 = L11_1
      L10_2 = A0_2
      L11_2 = L8_2
      L12_2 = A2_2 + 1
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      if L9_2 == nil then
        L10_2 = nil
        return L10_2
      end
      A1_2 = L9_2 + 1
    elseif L5_2 ~= nil then
      if L6_2 == L5_2 then
        L5_2 = nil
      end
      A1_2 = A1_2 + 1
    elseif L6_2 == "'" or L6_2 == "\"" then
      L5_2 = L6_2
      A1_2 = A1_2 + 1
    elseif L6_2 == "#" then
      if A1_2 ~= 1 then
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = string
        L9_2 = L9_2.sub
        L10_2 = A0_2
        L11_2 = A1_2 - 1
        L12_2 = A1_2 - 1
        L9_2 = L9_2(L10_2, L11_2, L12_2)
        L10_2 = "[%s;&|()]"
        L8_2 = L8_2(L9_2, L10_2)
        if not L8_2 then
          goto lbl_119
        end
      end
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = A0_2
      L10_2 = "[\r\n]"
      L11_2 = A1_2
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      A1_2 = L8_2 or A1_2
      if not L8_2 then
        L8_2 = #A0_2
        A1_2 = L8_2 + 1
      end
    else
      ::lbl_119::
      if L6_2 == L3_2 then
        L8_2 = L11_1
        L9_2 = A0_2
        L10_2 = A1_2
        L11_2 = A2_2 + 1
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        if L8_2 == nil then
          L9_2 = nil
          return L9_2
        end
        A1_2 = L8_2 + 1
      elseif L6_2 == L4_2 then
        return A1_2
      else
        A1_2 = A1_2 + 1
      end
    end
  end
  L6_2 = nil
  return L6_2
end

function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = string
  L2_2 = L2_2.sub
  L3_2 = A0_2
  L4_2 = A1_2
  L5_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A1_2 + 1
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 == "((" then
    L3_2 = L11_1
    L4_2 = A0_2
    L5_2 = A1_2
    L6_2 = 0
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 == nil then
      L4_2 = nil
      L5_2 = #A0_2
      L5_2 = L5_2 + 1
      L6_2 = false
      return L4_2, L5_2, L6_2
    end
    L4_2 = string
    L4_2 = L4_2.sub
    L5_2 = A0_2
    L6_2 = A1_2 + 2
    L7_2 = L3_2 - 2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = "$"
    L6_2 = L3_2 + 1
    L7_2 = false
    L8_2 = {}
    L9_2 = {}
    L9_2.text = L4_2
    L9_2.expression_only = true
    L8_2[1] = L9_2
    return L5_2, L6_2, L7_2, L8_2
  end
  L3_2 = L7_1
  L3_2 = L3_2[L2_2]
  if not L3_2 then
    L3_2 = string
    L3_2 = L3_2.find
    L4_2 = L2_2
    L5_2 = "%s"
    L3_2 = L3_2(L4_2, L5_2)
    if not L3_2 then
      goto lbl_57
    end
  end
  L3_2 = L2_2
  L4_2 = A1_2 + 1
  L5_2 = true
  do return L3_2, L4_2, L5_2 end
  ::lbl_57::
  if L2_2 == "#" then
    L3_2 = string
    L3_2 = L3_2.find
    L4_2 = A0_2
    L5_2 = "[\r\n]"
    L6_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = "\n"
    L5_2 = L3_2 or L5_2
    if not L3_2 then
      L5_2 = #A0_2
      L5_2 = L5_2 + 1
    end
    L6_2 = true
    return L4_2, L5_2, L6_2
  end
  L3_2 = {}
  L4_2 = {}
  L5_2 = nil
  while true do
    L6_2 = #A0_2
    if not (A1_2 <= L6_2) then
      break
    end
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L2_2 = L6_2
    L6_2 = string
    L6_2 = L6_2.sub
    L7_2 = A0_2
    L8_2 = A1_2 + 1
    L9_2 = A1_2 + 1
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if L2_2 == "\\" and L5_2 ~= "'" and L6_2 == "\n" then
      A1_2 = A1_2 + 2
    else
      if L2_2 == "\\" and L5_2 ~= "'" and L6_2 == "\r" then
        L7_2 = string
        L7_2 = L7_2.sub
        L8_2 = A0_2
        L9_2 = A1_2 + 2
        L10_2 = A1_2 + 2
        L7_2 = L7_2(L8_2, L9_2, L10_2)
        if L7_2 == "\n" then
          A1_2 = A1_2 + 3
      end
      else
        if L6_2 ~= "" then
          if L2_2 == "\\" and L5_2 ~= "'" then
            if L6_2 == L5_2 or L6_2 == "\\" or L6_2 == "$" or L6_2 == "`" then
              goto lbl_150
            end
            if L5_2 == nil then
              if L6_2 == "\"" or L6_2 == "'" then
                goto lbl_150
              end
              L7_2 = L7_1
              L7_2 = L7_2[L6_2]
              if L7_2 then
                goto lbl_150
              end
              L7_2 = string
              L7_2 = L7_2.find
              L8_2 = L6_2
              L9_2 = "%s"
              L7_2 = L7_2(L8_2, L9_2)
            end
          end
          if L7_2 or L2_2 == "^" and L5_2 == nil then
            ::lbl_150::
            L7_2 = #L3_2
            L7_2 = L7_2 + 1
            L3_2[L7_2] = L6_2
            A1_2 = A1_2 + 2
        end
        elseif L5_2 ~= "'" and (L2_2 == "`" or L2_2 == "$" and L6_2 == "(") then
          L7_2 = A1_2 or L7_2
          if L2_2 ~= "`" or not A1_2 then
            L7_2 = A1_2 + 1
          end
          L8_2 = L11_1
          L9_2 = A0_2
          L10_2 = L7_2
          L11_2 = 0
          L8_2 = L8_2(L9_2, L10_2, L11_2)
          if L8_2 == nil then
            L9_2 = nil
            L10_2 = #A0_2
            L10_2 = L10_2 + 1
            L11_2 = false
            return L9_2, L10_2, L11_2
          end
          L9_2 = L2_2 == "$"
          if L9_2 then
            L10_2 = 1
            if L10_2 then
              goto lbl_198
            end
          end
          L10_2 = 0
          ::lbl_198::
          L11_2 = #L4_2
          L11_2 = L11_2 + 1
          L12_2 = {}
          L13_2 = string
          L13_2 = L13_2.sub
          L14_2 = A0_2
          L15_2 = L7_2 + 1
          L15_2 = L15_2 + L10_2
          L16_2 = L8_2 - 1
          L16_2 = L16_2 - L10_2
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          L12_2.text = L13_2
          L12_2.expression_only = L9_2
          L4_2[L11_2] = L12_2
          L11_2 = #L3_2
          L11_2 = L11_2 + 1
          L3_2[L11_2] = "$"
          A1_2 = L8_2 + 1
        elseif L5_2 ~= nil then
          if L2_2 == L5_2 then
            L5_2 = nil
          else
            L7_2 = #L3_2
            L7_2 = L7_2 + 1
            L3_2[L7_2] = L2_2
          end
          A1_2 = A1_2 + 1
        elseif L2_2 == "\"" or L2_2 == "'" then
          L5_2 = L2_2
          A1_2 = A1_2 + 1
        else
          L7_2 = L7_1
          L7_2 = L7_2[L2_2]
          if not L7_2 then
            L7_2 = string
            L7_2 = L7_2.find
            L8_2 = L2_2
            L9_2 = "%s"
            L7_2 = L7_2(L8_2, L9_2)
            if not L7_2 then
              goto lbl_255
            end
          end
          L7_2 = table
          L7_2 = L7_2.concat
          L8_2 = L3_2
          L7_2 = L7_2(L8_2)
          L8_2 = A1_2
          L9_2 = false
          L10_2 = L4_2
          do return L7_2, L8_2, L9_2, L10_2 end
          goto lbl_259
          ::lbl_255::
          L7_2 = #L3_2
          L7_2 = L7_2 + 1
          L3_2[L7_2] = L2_2
          A1_2 = A1_2 + 1
        end
      end
    end
    ::lbl_259::
  end
  if L5_2 ~= nil then
    L6_2 = nil
    L7_2 = A1_2
    L8_2 = false
    return L6_2, L7_2, L8_2
  end
  L6_2 = table
  L6_2 = L6_2.concat
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  L7_2 = A1_2
  L8_2 = false
  L9_2 = L4_2
  return L6_2, L7_2, L8_2, L9_2
end

function L13_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A2_2 == "function"
  if L3_2 then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A0_2
    L6_2 = "%S"
    L7_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    A1_2 = L4_2 or A1_2
    if not L4_2 then
      L4_2 = #A0_2
      A1_2 = L4_2 + 1
    end
    L4_2 = nil
    L5_2 = L12_1
    L6_2 = A0_2
    L7_2 = A1_2
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    L4_2 = L6_2
    A2_2 = L5_2
    A1_2 = L4_2
  end
  if A2_2 ~= nil then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A2_2
    L6_2 = "^[%a_][%w_.%-]*$"
    L4_2 = L4_2(L5_2, L6_2)
    if L4_2 then
      goto lbl_36
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_36::
  L4_2 = string
  L4_2 = L4_2.find
  L5_2 = A0_2
  L6_2 = "%S"
  L7_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  A1_2 = L4_2 or A1_2
  if not L4_2 then
    L4_2 = #A0_2
    A1_2 = L4_2 + 1
  end
  L4_2 = string
  L4_2 = L4_2.sub
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 == "(" then
    L4_2 = string
    L4_2 = L4_2.find
    L5_2 = A0_2
    L6_2 = "%S"
    L7_2 = A1_2 + 1
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    if not L4_2 then
      L4_2 = #A0_2
      L4_2 = L4_2 + 1
    end
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = A0_2
    L7_2 = L4_2
    L8_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 ~= ")" then
      L5_2 = nil
      return L5_2
    end
    L5_2 = string
    L5_2 = L5_2.find
    L6_2 = A0_2
    L7_2 = "%S"
    L8_2 = L4_2 + 1
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    A1_2 = L5_2 or A1_2
    if not L5_2 then
      L5_2 = #A0_2
      A1_2 = L5_2 + 1
    end
  elseif not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = string
  L4_2 = L4_2.sub
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 ~= "{" and L4_2 ~= "(" then
    L5_2 = nil
    return L5_2
  end
  L5_2 = L11_1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = 0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 == nil then
    L6_2 = A2_2
    L7_2 = nil
    L8_2 = #A0_2
    L8_2 = L8_2 + 1
    return L6_2, L7_2, L8_2
  end
  L6_2 = A2_2
  L7_2 = string
  L7_2 = L7_2.sub
  L8_2 = A0_2
  L9_2 = A1_2 + 1
  L10_2 = L5_2 - 1
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = L5_2 + 1
  return L6_2, L7_2, L8_2
end

function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  if 4 < A1_2 then
    L4_2 = nil
    return L4_2
  end
  if not A2_2 then
    L4_2 = {}
    A2_2 = L4_2
  end
  L4_2 = 1
  L5_2 = true
  L6_2 = nil
  L7_2 = nil
  L8_2 = false
  L9_2 = false
  while true do
    L10_2 = #A0_2
    if not (L4_2 <= L10_2) then
      break
    end
    L10_2 = L12_1
    L11_2 = A0_2
    L12_2 = L4_2
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2)
    L4_2 = L11_2
    if L10_2 == nil then
      L14_2 = nil
      return L14_2
    end
    L14_2 = ipairs
    L15_2 = L13_2 or L15_2
    if not L13_2 then
      L15_2 = {}
    end
    L14_2, L15_2, L16_2 = L14_2(L15_2)
    for L17_2, L18_2 in L14_2, L15_2, L16_2 do
      L19_2 = {}
      L20_2 = pairs
      L21_2 = A2_2
      L20_2, L21_2, L22_2 = L20_2(L21_2)
      for L23_2, L24_2 in L20_2, L21_2, L22_2 do
        L19_2[L23_2] = L24_2
      end
      L20_2 = L14_1
      L21_2 = L18_2.text
      L22_2 = A1_2 + 1
      L23_2 = L19_2
      L24_2 = L18_2.expression_only
      L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2)
      if L20_2 then
        return L20_2
      end
    end
    L14_2 = string
    L14_2 = L14_2.lower
    L15_2 = L10_2
    L14_2 = L14_2(L15_2)
    if L12_2 then
      L15_2 = L7_1
      L15_2 = L15_2[L10_2]
      if L15_2 then
        L5_2 = true
        L6_2 = nil
        L7_2 = nil
        L8_2 = false
        L9_2 = false
      end
    elseif L9_2 then
      L9_2 = false
    elseif L8_2 then
      L15_2 = L14_1
      L16_2 = L10_2
      L17_2 = A1_2 + 1
      L15_2 = L15_2(L16_2, L17_2)
      if L15_2 then
        return L15_2
      end
      L8_2 = false
      L5_2 = false
    elseif L7_2 ~= nil then
      if L7_2 == "cmd" or L7_2 == "%comspec%" then
        L15_2 = string
        L15_2 = L15_2.sub
        L16_2 = L14_2
        L17_2 = 1
        L18_2 = 2
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        if L15_2 == "/c" or L15_2 == "/k" then
          L16_2 = #L10_2
          if 2 < L16_2 then
            L16_2 = L14_1
            L17_2 = string
            L17_2 = L17_2.sub
            L18_2 = L10_2
            L19_2 = 3
            L17_2 = L17_2(L18_2, L19_2)
            L18_2 = A1_2 + 1
            L16_2 = L16_2(L17_2, L18_2)
            if L16_2 then
              return L16_2
            end
          else
            L8_2 = true
          end
          L7_2 = nil
        end
      else
        L15_2 = string
        L15_2 = L15_2.find
        L16_2 = L10_2
        L17_2 = "^%-%a*c%a*$"
        L15_2 = L15_2(L16_2, L17_2)
        if L15_2 then
          L8_2 = true
          L7_2 = nil
        end
      end
    elseif L5_2 and not A3_2 then
      L15_2 = string
      L15_2 = L15_2.find
      L16_2 = L10_2
      L17_2 = "^[%a_][%w_]*="
      L15_2 = L15_2(L16_2, L17_2)
      if not L15_2 then
        L15_2 = L13_1
        L16_2 = A0_2
        L17_2 = L4_2
        L18_2 = L10_2
        L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2, L18_2)
        if L15_2 then
          if L16_2 == nil then
            L18_2 = nil
            return L18_2
          end
          A2_2[L15_2] = L16_2
          L4_2 = L17_2
          L5_2 = false
        else
          L18_2 = A2_2[L10_2]
          if L18_2 then
            L18_2 = L10_1
            L18_2 = L18_2[L6_2]
            if not L18_2 then
              L18_2 = L14_1
              L19_2 = A2_2[L10_2]
              L20_2 = A1_2 + 1
              L21_2 = A2_2
              L18_2 = L18_2(L19_2, L20_2, L21_2)
              if L18_2 then
                return L18_2
              end
              L5_2 = false
          end
          else
            if L6_2 ~= nil then
              L18_2 = string
              L18_2 = L18_2.sub
              L19_2 = L10_2
              L20_2 = 1
              L21_2 = 1
              L18_2 = L18_2(L19_2, L20_2, L21_2)
              if L18_2 == "-" then
                if L6_2 == "command" and (L10_2 == "-v" or L10_2 == "-V") then
                  L5_2 = false
                elseif L6_2 == "env" then
                  L9_2 = L10_2 == "-u" or L10_2 == "--unset" or L10_2 == "-C" or L10_2 == "--chdir"
                  if L10_2 == "-S" or L10_2 == "--split-string" then
                    L8_2 = true
                  end
                elseif L6_2 == "exec" and L10_2 == "-a" then
                  L9_2 = true
                end
            end
            else
              L18_2 = string
              L18_2 = L18_2.find
              L19_2 = L10_2
              L20_2 = "://"
              L21_2 = 1
              L22_2 = true
              L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
              if L18_2 then
                L5_2 = false
              else
                L18_2 = L14_2
                L19_2 = string
                L19_2 = L19_2.find
                L20_2 = string
                L20_2 = L20_2.reverse
                L21_2 = L18_2
                L20_2 = L20_2(L21_2)
                L21_2 = "[/\\]"
                L19_2 = L19_2(L20_2, L21_2)
                if L19_2 then
                  L20_2 = string
                  L20_2 = L20_2.sub
                  L21_2 = L18_2
                  L22_2 = #L18_2
                  L22_2 = L22_2 - L19_2
                  L22_2 = L22_2 + 2
                  L20_2 = L20_2(L21_2, L22_2)
                  L18_2 = L20_2
                end
                L20_2 = string
                L20_2 = L20_2.gsub
                L21_2 = L18_2
                L22_2 = "^@"
                L23_2 = ""
                L20_2 = L20_2(L21_2, L22_2, L23_2)
                L18_2 = L20_2
                L20_2 = string
                L20_2 = L20_2.gsub
                L21_2 = L18_2
                L22_2 = "%.exe$"
                L23_2 = ""
                L20_2 = L20_2(L21_2, L22_2, L23_2)
                L18_2 = L20_2
                L20_2 = L6_1
                L20_2 = L20_2[L18_2]
                if L20_2 then
                  return L18_2
                end
                L20_2 = L8_1
                L20_2 = L20_2[L18_2]
                if L20_2 then
                  L6_2 = L18_2
                else
                  L5_2 = false
                  L20_2 = L9_1
                  L20_2 = L20_2[L18_2]
                  if L20_2 then
                    L7_2 = L18_2
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L10_2 = nil
  return L10_2
end

L15_1 = nil
L16_1 = nil
L17_1 = ipairs
L18_1 = {}
L19_1 = "preinstall"
L20_1 = "install"
L21_1 = "postinstall"
L18_1[1] = L19_1
L18_1[2] = L20_1
L18_1[3] = L21_1
L17_1, L18_1, L19_1 = L17_1(L18_1)
for L20_1, L21_1 in L17_1, L18_1, L19_1 do
  L22_1 = L5_1.scripts
  L22_1 = L22_1[L21_1]
  L23_1 = type
  L24_1 = L22_1
  L23_1 = L23_1(L24_1)
  if L23_1 == "string" then
    L23_1 = #L22_1
    if 0 < L23_1 then
      L23_1 = #L22_1
      if L23_1 <= 32768 then
        L23_1 = L14_1
        L24_1 = L22_1
        L25_1 = 0
        L23_1 = L23_1(L24_1, L25_1)
        if L23_1 then
          L15_1 = L21_1
          L16_1 = L23_1
          break
        end
      end
    end
  end
end
if L16_1 == nil then
  L17_1 = mp
  L17_1 = L17_1.CLEAN
  return L17_1
end
L17_1 = mp
L17_1 = L17_1.SetDetectionString
L18_1 = "hook="
L19_1 = L15_1
L20_1 = ";lolbin="
L21_1 = L16_1
L18_1 = L18_1 .. L19_1 .. L20_1 .. L21_1
L17_1(L18_1)
L17_1 = mp
L17_1 = L17_1.INFECTED
return L17_1
