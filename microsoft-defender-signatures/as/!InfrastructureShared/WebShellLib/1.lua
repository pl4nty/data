-- Threat: !InfrastructureShared
-- Name: WebShellLib
-- Type: 1

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function WsPhpUnhex(p1_0)
  if type(p1_0) == "string" then
    local r1_0 = #p1_0
    if r1_0 ~= 0 and not (r1_0 > 4096) and r1_0 % 2 == 0 then
      if string.find(p1_0, "[^%x]") then
        return nil
      end
      return (string.gsub(p1_0, "%x%x",
        function(p2_0)
          return string.char(tonumber(p2_0, 16))
        end))
    end
    return nil
  end
  return nil
end

function WsPhpRot13(p3_0)
  if type(p3_0) == "string" then
    return (string.gsub(p3_0, "%a",
      function(p4_0)
        local r4_0 = string.byte(p4_0)
        local r4_1 = r4_0 >= 97 and 97 or 65
        return string.char((r4_0 - r4_1 + 13) % 26 + r4_1)
      end))
  end
  return nil
end

function WsPhpUnescapeDq(p5_0)
  if type(p5_0) == "string" then
    if string.find(p5_0, "\\", 1, true) then
      local r5_0 = string.find
      local r5_1 = string.sub
      local r5_2 = string.match
      local r5_3 = {}
      local r5_4, r5_5 = 0, 1
      local r5_6 = #p5_0
      while r5_5 <= r5_6 do
        local r5_7 = r5_0
        r5_7 = r5_7(p5_0, "\\", r5_5, true)
        if not r5_7 or r5_7 == r5_6 then
          r5_4 = r5_4 + 1
          r5_3[r5_4] = r5_1(p5_0, r5_5)
          break
        end
        if r5_5 < r5_7 then
          r5_4 = r5_4 + 1
          r5_3[r5_4] = r5_1(p5_0, r5_5, r5_7 - 1)
        end
        local r5_8 = r5_1(p5_0, r5_7 + 1, r5_7 + 1)
        local r5_9 = 2
        local r5_10 = "\\" .. r5_8
        if r5_8 == "x" or r5_8 == "X" then
          local r5_11 = r5_2(p5_0, "^%x%x?", r5_7 + 2)
          if r5_11 then
            r5_10 = string.char(tonumber(r5_11, 16))
            r5_9 = 2 + #r5_11
          end
        elseif r5_0(r5_8, "[0-7]") then
          local r5_12 = r5_2(p5_0, "^[0-7][0-7]?[0-7]?", r5_7 + 1)
          r5_10 = string.char(tonumber(r5_12, 8) % 256)
          r5_9 = 1 + #r5_12
        elseif r5_8 == "n" then
          r5_10 = "\n"
        elseif r5_8 == "t" then
          r5_10 = "\t"
        elseif r5_8 == "r" then
          r5_10 = "\r"
        elseif r5_8 == "\\" or r5_8 == '"' or r5_8 == "$" then
          r5_10 = r5_8
        end
        r5_4 = r5_4 + 1
        r5_3[r5_4] = r5_10
        r5_5 = r5_7 + r5_9
      end
      return table.concat(r5_3)
    end
    return p5_0
  end
  return ""
end

function WsPhpFamilyMarker(p6_0)
  local r6_0 = {
    "c99shell", "c99_buff_prepare", "r57shell", "r57_get_info", "wso_version", "b374k", "weevely",
    "p0wny", "antsword", "behinder", "godzilla", "china chopper", "phpspy", "phpremoteview",
    "php-reverse-shell", "pentestmonkey"
  }
  for r6_1 = 1, #r6_0 do
    if string.find(p6_0, r6_0[r6_1], 1, true) then
      return true
    end
  end
  return false
end

function WsPhpPrefilter(p7_0)
  local r7_0 = {
    "$_post", "$_get", "$_request", "$_cookie", "$_files", "$_server", "php://input",
    "getallheaders", "eval", "assert", "system", "exec", "passthru", "popen", "create_function",
    "call_user_func", "hex2bin", "base64_decode", "str_rot13", "strrev", "gzinflate", "pack("
  }
  for r7_1 = 1, #r7_0 do
    if string.find(p7_0, r7_0[r7_1], 1, true) then
      return true
    end
  end
  if string.find(p7_0, "unlink", 1, true)
    and (string.find(p7_0, "include", 1, true) or string.find(p7_0, "require", 1, true)) then
    return true
  end
  if string.find(p7_0, "%$[%a_][%w_]*[%s/%*]*%(") then
    return true
  end
  if string.find(p7_0, "%][%s/%*]*%(") then
    return true
  end
  return false
end

function WsPhpSkeleton(p8_0, p8_1)
  local r8_0 = string.find
  local r8_1 = string.sub
  local r8_2 = string.lower
  local r8_3 = string.gsub
  local r8_4 = {}
  local r8_5 = 0
  local r8_6 = #p8_0
  local r8_7, r8_8 = 1, 0

  local function r8_9(p9_0)
    if r8_0(p9_0, "[\001-\007]") then
      p9_0 = r8_3(p9_0, "[\001-\007]", " ")
    end
    r8_5 = r8_5 + 1
    r8_4[r8_5] = r8_2(p9_0)
  end

  local function r8_10(p10_0, p10_1, p10_2)
    r8_5 = r8_5 + 1
    if #p10_0 <= 64 and not r8_0(p10_0, "[^%w_:/%.%*%-%+=]") then
      local r10_0 = r8_2(p10_0)
      p10_0 = r10_0 == "php://input" and "php://input" or p10_0
      if p10_2 then
        r10_0 = r8_4
        local r10_1 = r8_5
        local r10_2 = "\001!"
        local r10_3 = p10_0
        r10_0[r10_1] = r10_2 .. r10_3 .. "\002"
      else
        r10_0 = r8_4
        local r10_4 = r8_5
        local r10_5 = "\001"
        local r10_6 = p10_0
        r10_0[r10_4] = r10_5 .. r10_6 .. "\002"
      end
      return
    end
    r8_4[r8_5] = "\001\007\002"
    if p10_1 and r8_0(p10_0, "$", 1, true) then
      local r10_7 = 0
      for r10_8 in string.gmatch(p10_0, "%$([%a_][%w_]*)") do
        r10_7 = r10_7 + 1
        if r10_7 > 4 then
          break
        end
        r8_5 = r8_5 + 1
        r8_4[r8_5] = ".$" .. r8_2(r10_8)
      end
    end
  end

  local function r8_11(p11_0, p11_1)
    local r11_0
    local r11_1 = p11_0 + 1
    while true do
      r11_0 = r8_0(p8_0, p11_1, r11_1)
      if not r11_0 or r8_1(p8_0, r11_0, r11_0) ~= "\\" then
        break
      end
      r11_1 = r11_0 + 2
    end
    if r11_0 then
      return r8_1(p8_0, p11_0 + 1, r11_0 - 1), r11_0 + 1
    end
    return r8_1(p8_0, p11_0 + 1), r8_6 + 1
  end

  local function r8_12(p12_0)
    local r12_0 = r8_0(p8_0, "\n", p12_0, true)
    local r12_1 = r8_1(p8_0, p12_0, r12_0 or r8_6)
    local r12_2 = r8_0(r12_1, "?>", 1, true)
    if r12_2 then
      return p12_0 + r12_2 - 1
    end
    if r12_0 then
      return r12_0 + 1
    end
    return r8_6 + 1
  end

  local function r8_13(p13_0, p13_1)
    local r13_0 = p13_0
    local r13_1 = #p13_1
    while true do
      local r13_2 = r8_0(p8_0, "\n", r13_0, true)
      if not r13_2 then
        break
      end
      local r13_3, r13_4
      r13_3, r13_4 = r8_0(p8_0, "^[ \t]*", r13_2 + 1)
      local r13_5 = r13_4 + 1
      if r8_1(p8_0, r13_5, r13_5 + r13_1 - 1) == p13_1 then
        local r13_6 = r8_1(p8_0, r13_5 + r13_1, r13_5 + r13_1)
        if r13_6 == "" or not r8_0(r13_6, "[%w_]") then
          return r13_2, r13_5 + r13_1
        end
      end
      r13_0 = r13_2 + 1
    end
    return nil
  end

  while r8_7 <= r8_6 do
    r8_8 = r8_8 + 1
    if r8_8 > 4000 then
      break
    end
    if p8_1 then
      local r8_14, r8_15, r8_16 = r8_0(p8_0, "([\"'/#?<])", r8_7)
      if r8_14 then
        if r8_7 < r8_14 then
          r8_9(r8_1(p8_0, r8_7, r8_14 - 1))
        end
        if r8_16 == "'" then
          local r8_17, r8_18 = r8_11(r8_14, "['\\]")
          if r8_0(r8_17, "\\", 1, true) then
            r8_17 = r8_3(r8_17, "\\([\\'])", "%1")
          end
          r8_10(r8_17, false)
          r8_7 = r8_18
        elseif r8_16 == '"' then
          local r8_19, r8_20 = r8_11(r8_14, '["\\]')
          local r8_21 = r8_0
          r8_21 = r8_21(r8_19, "\\[xX0-7]")
          local r8_22 = r8_21 ~= nil
          local r8_23 = r8_10
          r8_23(WsPhpUnescapeDq(r8_19), true, r8_22)
          r8_7 = r8_20
        elseif r8_16 == "/" then
          local r8_24 = r8_1(p8_0, r8_14 + 1, r8_14 + 1)
          if r8_24 == "/" then
            r8_7 = r8_12(r8_14)
            r8_9(" ")
          elseif r8_24 == "*" then
            local r8_25 = r8_0(p8_0, "*/", r8_14 + 2, true)
            if r8_25 then
              r8_7 = r8_25 + 2
            else
              r8_7 = r8_6 + 1
            end
            r8_9(" ")
          else
            r8_9("/")
            r8_7 = r8_14 + 1
          end
        elseif r8_16 == "#" then
          if r8_1(p8_0, r8_14 + 1, r8_14 + 1) == "[" then
            r8_9("#")
            r8_7 = r8_14 + 1
          else
            r8_7 = r8_12(r8_14)
            r8_9(" ")
          end
        elseif r8_16 == "?" then
          if r8_1(p8_0, r8_14 + 1, r8_14 + 1) == ">" then
            r8_9(";")
            p8_1 = false
            r8_7 = r8_14 + 2
          else
            r8_9("?")
            r8_7 = r8_14 + 1
          end
        else
          local r8_26, r8_27, r8_28, r8_29 = nil, nil, nil, nil
          if r8_1(p8_0, r8_14, r8_14 + 2) == "<<<" then
            r8_26, r8_27, r8_28, r8_29 = r8_0(p8_0, "^<<<[ \t]*([\"']?)([%a_][%w_]*)%1[ \t]*\r?\n",
              r8_14)
          end
          if r8_26 then
            local r8_30, r8_31 = r8_13(r8_27, r8_29)
            local r8_32 = nil
            if r8_30 then
              local r8_33 = r8_1
              r8_33 = r8_33(p8_0, r8_27 + 1, r8_30 - 1)
              r8_7, r8_32 = r8_31, r8_33
            else
              r8_32 = r8_1(p8_0, r8_27 + 1)
              r8_7 = r8_6 + 1
            end
            r8_10(r8_32, r8_28 ~= "'")
          else
            r8_9("<")
            r8_7 = r8_14 + 1
          end
        end
      else
        r8_9(r8_1(p8_0, r8_7))
        r8_7 = r8_6 + 1
      end
    else
      local r8_34 = r8_0(p8_0, "<?", r8_7, true)
      if not r8_34 then
        break
      end
      r8_7 = r8_34 + 2
      local r8_35 = r8_2(r8_1(p8_0, r8_7, r8_7 + 2))
      if r8_35 == "xml" then
        local r8_36 = r8_0
        r8_36 = r8_36(p8_0, "?>", r8_7, true)
        if not r8_36 then
          break
        end
        r8_7 = r8_36 + 2
      else
        if r8_35 == "php" then
          r8_7 = r8_7 + 3
        elseif r8_1(p8_0, r8_7, r8_7) == "=" then
          r8_7 = r8_7 + 1
          r8_9(" echo ")
        end
        p8_1 = true
        r8_9(" ")
      end
    end
  end
  local r8_37 = table.concat(r8_4)
  local r8_38 = r8_3
  r8_38 = r8_38(r8_37, "%s+", " ")
  r8_38 = r8_3(r8_38, " ?([^%w_ ]) ?", "%1")
  return r8_38
end

function WsPhpSkeletonFast(p14_0, p14_1)
  local r14_0 = string.find
  local r14_1 = string.sub
  local r14_2 = string.gsub
  local r14_3 = p14_0
  if not p14_1 then
    local r14_4 = r14_0(r14_3, "<?", 1, true)
    if not r14_4 then
      return "", false
    end
    r14_3 = r14_1(r14_3, r14_4)
  end
  if r14_0(r14_3, "[\001-\007]") then
    r14_3 = r14_2(r14_3, "[\001-\007]", " ")
  end
  if r14_0(r14_3, "\\", 1, true) then
    local r14_5 = r14_2(r14_3, "\\\\", "\005")
    r14_5 = r14_2(r14_5, "\\[\"']", "\004")
    r14_3 = r14_5
    r14_5 = r14_0
    r14_5 = r14_5(r14_3, "\\[xX]%x%x")
    if r14_5 then
      r14_3 = r14_2(r14_3, "\\[xX](%x%x)",
        function(p15_0)
          local r15_0 = string.char(tonumber(p15_0, 16))
          if r14_0(r15_0, "[%w_]") then
            return "\003" .. r15_0
          end
          return nil
        end,
        256)
    end
    r14_5 = r14_0
    if r14_5(r14_3, "\\[0-7][0-7][0-7]") then
      r14_3 = r14_2(r14_3, "\\([0-7][0-7][0-7])",
        function(p16_0)
          local r16_0 = string.char(tonumber(p16_0, 8) % 256)
          if r14_0(r16_0, "[%w_]") then
            return "\003" .. r16_0
          end
          return nil
        end,
        128)
    end
  end
  if r14_0(r14_3, "<<<", 1, true) then
    r14_3 = r14_2(r14_3, "<<<[\"']?([%a_][%w_]*)[\"']?\r?\n.-\n[ \t]*%1", "\001\007\002")
  end
  r14_3 = r14_2(r14_3, [["([^"
]*)"]], "\001%1\002")
  if r14_0(r14_3, "\001[^\002$]*%$[%a_]") then
    r14_3 = r14_2(r14_2(r14_3, "\001([^\002$]*)(%$[%a_][%w_]*)", "%2.\001%1"),
      "\001([^\002$]*)(%$[%a_][%w_]*)", "%2.\001%1")
  end
  local r14_6 = r14_2
  r14_6 = r14_6(r14_3, "'([^'\n\001\002]*)'", "\001%1\002")
  r14_6 = r14_2(r14_6, "\001[^\002]*[^%w_:/%.%*%-%+=\003\002][^\002]*\002", "\001\007\002")
  r14_3 = r14_6
  r14_6 = r14_0
  r14_6 = r14_6(r14_3, "?>", 1, true)
  if r14_6 then
    local r14_7 = r14_2(r14_3, "%?>.-<%?", "\006")
    r14_7 = r14_2(r14_7, "\006[pP][hH][pP]", ";")
    r14_3 = r14_7
    r14_7 = r14_2
    r14_7 = r14_7(r14_3, "\006=", ";echo ")
    r14_3 = r14_7
    r14_7 = r14_2
    local r14_8 = r14_3
    r14_7 = r14_7(r14_8, "\006", ";")
    r14_3 = r14_7
    r14_7 = r14_0
    r14_8 = r14_3
    r14_7 = r14_7(r14_8, "?>", 1, true)
    if r14_7 then
      local r14_9 = r14_1
      r14_9 = r14_9(r14_3, 1, r14_7 - 1)
      r14_3 = r14_9 .. ";"
    end
  end
  local r14_10 = r14_2(r14_3, "<%?[pP][hH][pP]", " ")
  r14_10 = r14_2(r14_10, "<%?=", " echo ")
  r14_3 = r14_10
  r14_10 = r14_2
  r14_10 = r14_10(r14_3, "<%?", " ")
  r14_3 = r14_10
  r14_10 = r14_0
  local r14_11 = r14_3
  r14_10 = r14_10(r14_11, "/*", 1, true)
  if r14_10 then
    r14_3 = r14_2(r14_2(r14_3, "([%s;{}%(%),])/%*.-%*/", "%1 "), "(%w)/%*[^/\n\001\002]-%*/", "%1 ")
  end
  r14_10 = r14_0
  r14_11 = r14_3
  r14_10 = r14_10(r14_11, "//", 1, true)
  if r14_10 then
    r14_3 = r14_2(r14_3, [[([;{}%s%)])//[^
]*]], "%1")
  end
  r14_10 = r14_0
  r14_10 = r14_10(r14_3, "#", 1, true)
  if r14_10 then
    r14_3 = r14_2(r14_3, [[([;{}%s%)])#[^%[
][^
]*]], "%1")
  end
  local r14_12 = false
  r14_11 = r14_0
  r14_11 = r14_11(r14_3, "64_", 1, true)
  if r14_11 then
    r14_3 = r14_2(r14_3,
      "[bB][aA][sS][eE]64_[dD][eE][cC][oO][dD][eE]%s*%(%s*\001([^\002]*)\002%s*%)",
      function(p17_0)
        if not (#p17_0 < 4) and not (#p17_0 > 4096) and not r14_0(p17_0, "[\003\007]") then
          local r17_0, r17_1 = pcall(MpCommon.Base64Decode, p17_0)
          if r17_0
            and type(r17_1) == "string"
            and #r17_1 ~= 0
            and not (#r17_1 > 64)
            and not r14_0(r17_1, "[^%w_:/%.%*%-]") then
            r14_12 = true
            return "\001!" .. r17_1 .. "\002"
          end
          return nil
        end
        return nil
      end,
      32)
  end
  r14_11 = string
  r14_11 = r14_11.lower
  r14_11 = r14_11(r14_3)
  r14_3 = r14_11
  r14_11 = r14_2
  r14_11 = r14_11(r14_3, "%s+", " ")
  r14_11 = r14_2(r14_11, " ?([^%w_ ]) ?", "%1")
  r14_3 = r14_11
  r14_11 = r14_3
  return r14_11, r14_12
end

function WsPhpAnalyze(p18_0, p18_1)
  local r18_0, r18_1, r18_2, r18_3, r18_4, r18_5, r18_6, r18_7, r18_8, r18_9, r18_10, r18_11, r18_12
  local r18_13 = {}
  if type(p18_0) == "string" then
    local r18_14 = string.find
    local r18_15 = string.sub
    local r18_16 = string.lower
    local r18_17 = string.gsub
    local r18_18 = string.gmatch
    local r18_19 = string.match
    local r18_20 = {
      system = true, exec = true, shell_exec = true, passthru = true, popen = true, proc_open = true,
      pcntl_exec = true, assert = true, create_function = true, call_user_func = true,
      call_user_func_array = true
    }
    local r18_21 = {
      _get = true, _post = true, _request = true, _cookie = true, _files = true, _server = true,
      _env = true, _session = true, globals = true, this = true
    }
    local r18_22 = { _get = true, _post = true, _request = true, _cookie = true, _files = true }

    local function r18_23(p19_0, p19_1, p19_2)
      local r19_0 = p19_0 .. "("
      local r19_1, r19_2, r19_3 = 1, 0, 0
      while r19_2 < p19_1 and r19_3 < p19_1 * 4 + 12 do
        local r19_4, r19_5 = r18_14(p18_0, r19_0, r19_1, true)
        if not r19_4 then
          return
        end
        r19_1 = r19_5 + 1
        r19_3 = r19_3 + 1
        local r19_6 = true
        if r19_4 > 1 then
          local r19_7 = r18_15(p18_0, r19_4 - 1, r19_4 - 1)
          if r18_14(r19_7, "[%w_%$]") then
            r19_6 = false
          elseif r19_7 == ">" or r19_7 == ":" then
            local r19_8 = r18_15
            local r19_9 = p18_0
            local r19_10 = r19_4 > 2 and r19_4 - 2 or 1
            r19_8 = r19_8(r19_9, r19_10, r19_4 - 1)
            if r19_8 == "->" or r19_8 == "::" then
              r19_6 = false
            end
          elseif r19_7 == "\\" then
            if r19_4 > 2 and r18_14(r18_15(p18_0, r19_4 - 2, r19_4 - 2), "[%w_]") then
              r19_6 = false
            end
          elseif r19_7 == " " or r19_7 == "&" then
            local r19_11 = r18_15
            local r19_12 = p18_0
            local r19_13 = r19_4 > 10 and r19_4 - 10 or 1
            r19_11 = r19_11(r19_12, r19_13, r19_4 - 1)
            if r18_14(r19_11, "function[ &]$") or r18_14(r19_11, "new $") then
              r19_6 = false
            end
          end
        end
        if r19_6 then
          r19_2 = r19_2 + 1
          local r19_14, r19_15 = r18_14(p18_0, "^%b()", r19_5)
          local r19_16 = nil
          if r19_14 then
            r19_16 = r18_15(p18_0, r19_14 + 1, r19_15 - 1)
          else
            r19_16 = r18_15(p18_0, r19_5 + 1, r19_5 + 240)
          end
          if #r19_16 > 1200 then
            r19_16 = r18_15(r19_16, 1, 1200)
          end
          p19_2(r19_16)
        end
      end
    end

    local function r18_24(p20_0)
      local r20_0 = false
      r18_23(p20_0, 1,
        function()
          r20_0 = true
        end)
      return r20_0
    end

    local function r18_25(p22_0)
      if r18_14(p22_0, "$_", 1, true) then
        if not r18_14(p22_0, "$_post", 1, true)
          and not r18_14(p22_0, "$_get", 1, true)
          and not r18_14(p22_0, "$_request", 1, true)
          and not r18_14(p22_0, "$_cookie", 1, true)
          and not r18_14(p22_0, "$_files", 1, true) then
          if r18_14(p22_0, "php://input", 1, true) then
            return true
          end
          if not r18_14(p22_0, "getallheaders(", 1, true)
            and not r18_14(p22_0, "apache_request_headers(", 1, true) then
            if r18_14(p22_0, "$_server", 1, true) then
              if r18_14(p22_0, "%$_server%[%$") then
                return true
              end
              if r18_14(p22_0, "%$_server%[\001!?[hH][tT][tT][pP]_") then
                return true
              end
              if r18_14(p22_0, "%$_server[^%[]") or r18_14(p22_0, "%$_server$") then
                return true
              end
            end
            return false
          end
          return true
        end
        return true
      end
      if r18_14(p22_0, "php://input", 1, true) then
        return true
      end
      if r18_14(p22_0, "headers(", 1, true)
        and (r18_14(p22_0, "getallheaders(", 1, true)
          or r18_14(p22_0, "apache_request_headers(", 1, true)) then
        return true
      end
      return false
    end

    local function r18_26(p23_0)
      if r18_14(p23_0, "(", 1, true) then
        if r18_14(p23_0, "escapeshell", 1, true) then
          p23_0 = r18_17(r18_17(p23_0, "escapeshellarg%b()", ""), "escapeshellcmd%b()", "")
        end
        if r18_14(p23_0, "isset(", 1, true) then
          p23_0 = r18_17(p23_0, "isset%b()", "")
        end
        if r18_14(p23_0, "empty(", 1, true) then
          p23_0 = r18_17(p23_0, "empty%b()", "")
        end
        if r18_14(p23_0, "count(", 1, true) then
          p23_0 = r18_17(p23_0, "count%b()", "")
        end
        if r18_14(p23_0, "strlen(", 1, true) then
          p23_0 = r18_17(p23_0, "strlen%b()", "")
        end
        if r18_14(p23_0, "md5(", 1, true) then
          p23_0 = r18_17(p23_0, "md5%b()", "")
        end
        if r18_14(p23_0, "sha1(", 1, true) then
          p23_0 = r18_17(p23_0, "sha1%b()", "")
        end
        return p23_0
      end
      return p23_0
    end

    local function r18_27(p24_0)
      if r18_14(p24_0, "val(", 1, true) then
        p24_0 = r18_17(r18_17(p24_0, "intval%b()", ""), "floatval%b()", "")
      end
      if r18_14(p24_0, "absint(", 1, true) then
        p24_0 = r18_17(p24_0, "absint%b()", "")
      end
      if r18_14(p24_0, "(int)", 1, true) then
        p24_0 = r18_17(r18_17(p24_0, "%(int%)%$[%w_]+%b[]", ""), "%(int%)%$[%w_]+", "")
      end
      if r18_14(p24_0, "(float)", 1, true) then
        p24_0 = r18_17(r18_17(p24_0, "%(float%)%$[%w_]+%b[]", ""), "%(float%)%$[%w_]+", "")
      end
      return p24_0
    end

    local r18_28 = {
      "base64_decode", "gzinflate", "gzuncompress", "gzdecode", "str_rot13", "hex2bin",
      "convert_uudecode", "strrev"
    }
    for r18_29 = 1, #r18_28 do
      if r18_24(r18_28[r18_29]) then
        r18_13["Xform.Decode"] = true
        break
      end
    end
    if p18_1
      or r18_14(p18_0, "pack(\001H*\002", 1, true)
      or r18_14(p18_0, "pack(\001h*\002", 1, true) then
      r18_13["Xform.Decode"] = true
    end
    if r18_24("chr") and r18_24("ord") and r18_14(p18_0, "^", 1, true) then
      r18_13["Xform.CharLoop"] = true
    end
    local r18_30 = false
    if p18_1 then
      r18_30 = true
    end

    local function r18_31(p25_0)
      if r18_14(p25_0, "\007", 1, true) then
        return nil
      end
      if r18_15(p25_0, 1, 1) == "!" then
        return r18_15(p25_0, 2)
      end
      return p25_0
    end

    local function r18_32(p26_0)
      if #p26_0 <= 64 and not r18_14(p26_0, "[^%w_:/%.%*%-]") then
        return "\001!" .. p26_0 .. "\002"
      end
      return "\001\007\002"
    end

    local function r18_33(p27_0)
      if r18_14(p27_0, "\002.\001", 1, true) then
        p27_0 = r18_17(p27_0, "\002%.\001!?", "\003")
      end
      if r18_14(p27_0, "\003", 1, true) then
        p27_0 = r18_17(r18_17(p27_0, "\001!?([^\002]*\003[^\002]*)\002", "\001!%1\002"), "\003", "")
      end
      return p27_0
    end

    local function r18_34(p28_0)
      local r28_0, r28_1 = 0, 0
      if r18_14(p28_0, "pack(", 1, true) then
        local r28_2, r28_3 = r18_17(p28_0, "pack%(\001!?[hH]%*\002,\001([^\002]*)\002%)",
          function(p29_0)
            local r29_0 = r18_31(p29_0)
            local r29_1 = r29_0 and WsPhpUnhex(r29_0)
            if r29_1 then
              r18_30 = true
              return r18_32(r29_1)
            end
            return nil
          end,
          32)
        r28_1 = r28_3
        p28_0 = r28_2
        r28_0 = r28_0 + r28_1
      end
      if r18_14(p28_0, "hex2bin(", 1, true) then
        local r28_4, r28_5 = r18_17(p28_0, "hex2bin%(\001([^\002]*)\002%)",
          function(p30_0)
            local r30_0 = r18_31(p30_0)
            local r30_1 = r30_0 and WsPhpUnhex(r30_0)
            if r30_1 then
              r18_30 = true
              return r18_32(r30_1)
            end
            return nil
          end,
          32)
        r28_1 = r28_5
        p28_0 = r28_4
        r28_0 = r28_0 + r28_1
      end
      if r18_14(p28_0, "base64_decode(", 1, true) then
        local r28_6, r28_7 = r18_17(p28_0, "base64_decode%(\001([^\002]*)\002%)",
          function(p31_0)
            local r31_0 = r18_31(p31_0)
            if r31_0 and not (#r31_0 < 4) and not (#r31_0 > 4096) then
              local r31_1, r31_2 = pcall(MpCommon.Base64Decode, r31_0)
              if r31_1 and type(r31_2) == "string" and #r31_2 ~= 0 then
                r18_30 = true
                return r18_32(r31_2)
              end
              return nil
            end
            return nil
          end,
          32)
        r28_1 = r28_7
        p28_0 = r28_6
        r28_0 = r28_0 + r28_1
      end
      if r18_14(p28_0, "strrev(", 1, true) then
        local r28_8, r28_9 = r18_17(p28_0, "strrev%(\001([^\002]*)\002%)",
          function(p32_0)
            local r32_0 = r18_31(p32_0)
            if r32_0 and #r32_0 ~= 0 and not (#r32_0 > 4096) then
              r18_30 = true
              return r18_32(string.reverse(r32_0))
            end
            return nil
          end,
          32)
        r28_1 = r28_9
        p28_0 = r28_8
        r28_0 = r28_0 + r28_1
      end
      if r18_14(p28_0, "str_rot13(", 1, true) then
        local r28_10, r28_11 = r18_17(p28_0, "str_rot13%(\001([^\002]*)\002%)",
          function(p33_0)
            local r33_0 = r18_31(p33_0)
            if r33_0 and #r33_0 ~= 0 and not (#r33_0 > 4096) then
              r18_30 = true
              return r18_32(WsPhpRot13(r33_0))
            end
            return nil
          end,
          32)
        r28_1 = r28_11
        p28_0 = r28_10
        r28_0 = r28_0 + r28_1
      end
      return p28_0, r28_0
    end

    local r18_35 = r18_14
    r18_35 = r18_35(p18_0, "chr(", 1, true)
    if r18_35 then
      local r18_36 = r18_17(p18_0, "chr%((%d+)%)",
        function(p34_0)
          local r34_0 = tonumber(p34_0)
          if r34_0 and not (r34_0 > 255) then
            return r18_32(string.char(r34_0))
          end
          return nil
        end,
        128)
      p18_0 = r18_36
    end
    local r18_37 = r18_33(p18_0)
    p18_0 = r18_37
    r18_37 = 1
    for r18_38 = r18_37, 2 do
      local r18_39 = 0
      local r18_40, r18_41 = r18_34(p18_0)
      p18_0 = r18_40
      if r18_41 == 0 then
        break
      end
      local r18_42 = r18_33(p18_0)
      p18_0 = r18_42
    end
    if r18_30 then
      r18_13["Xform.LitDecode"] = true
    end
    local r18_43 = #p18_0
    local r18_44 = {}
    local r18_45, r18_46 = 0, 0
    local r18_47, r18_48, r18_49 = r18_18(p18_0, "\001!([acepsACEPS][%w_]+)\002")
    for r18_50 in r18_47, r18_48, r18_49 do
      r18_46 = r18_46 + 1
      if r18_46 > 60 then
        break
      end
      local r18_51 = r18_16
      r18_51 = r18_51(r18_50)
      if r18_20[r18_51] and not r18_44[r18_51] then
        r18_44[r18_51] = true
        r18_45 = r18_45 + 1
      end
    end
    if r18_45 >= 1 then
      r18_13["Indirect.HiddenSink"] = true
    end
    if r18_45 >= 3 then
      r18_13["Indirect.HiddenSinkMulti"] = true
    end
    r18_47 = {}
    local r18_52 = 0
    local r18_53
    r18_48, r18_49, r18_53 = r18_18(p18_0, "%$([%a_][%w_]*)=\001(!?)([acepsACEPS][%w_]+)\002")
    for r18_54, r18_55, r18_56 in r18_48, r18_49, r18_53 do
      r18_52 = r18_52 + 1
      if r18_52 > 200 then
        break
      end
      local r18_57 = r18_16
      r18_57 = r18_57(r18_56)
      r18_57 = r18_20[r18_57]
      if r18_57 then
        if r18_55 == "!" then
          r18_47[r18_54] = "hidden"
        else
          r18_47[r18_54] = "plain"
        end
      end
    end
    local r18_58 = false
    r18_49 = r18_14(p18_0, "=$_server;", 1, true)
    if r18_49 then
      r18_58 = true
    end

    function r18_49(p35_0)
      local r35_0 = r18_14(p18_0, ";", p35_0, true) or r18_43 + 1
      if r35_0 - p35_0 > 1500 then
        r35_0 = p35_0 + 1500
      end
      return r18_15(p18_0, p35_0, r35_0 - 1)
    end

    r18_53 = {}
    local r18_59 = r18_14
    r18_59 = r18_59(p18_0, "foreach(", 1, true)
    if r18_59 then
      local r18_60 = 0
      r18_0, r18_1, r18_2 = r18_18(p18_0, "foreach%(([^;{]-) ?as ?&?(%$[^%)]*)%)")
      for r18_61, r18_62 in r18_0, r18_1, r18_2 do
        r18_60 = r18_60 + 1
        if r18_60 > 40 then
          break
        end
        r18_3, r18_4, r18_5 = r18_18(r18_62, "%$([%a_][%w_]*)")
        for r18_63 in r18_3, r18_4, r18_5 do
          if not r18_53[r18_63] then
            r18_53[r18_63] = r18_61
          end
        end
      end
    end
    local r18_64 = {}
    local r18_65 = 0
    local r18_66 = nil

    local function r18_67(p36_0, p36_1)
      local r36_0 = r18_64[p36_0]
      if r36_0 == nil then
        if not r18_21[p36_0] and not (p36_1 > 5) and not (r18_65 >= 60) then
          r18_65 = r18_65 + 1
          r18_64[p36_0] = 0
          local r36_1 = 0
          local r36_2 = "$" .. p36_0 .. "="
          local r36_3, r36_4 = 1, 0
          while r36_4 < 6 and r36_1 < 2 do
            local r36_5, r36_6 = r18_14(p18_0, r36_2, r36_3, true)
            if not r36_5 then
              break
            end
            r36_3 = r36_6 + 1
            r36_4 = r36_4 + 1
            local r36_7 = r18_15(p18_0, r36_6 + 1, r36_6 + 1)
            if r36_7 ~= "=" and r36_7 ~= ">" then
              local r36_8 = r18_66(r18_49(r36_6 + 1), p36_1 + 1)
              if r36_1 < r36_8 then
                r36_1 = r36_8
              end
            end
          end
          r36_2 = "$" .. p36_0 .. ".="
          r36_3, r36_4 = 1, 0
          while r36_4 < 4 and r36_1 < 2 do
            local r36_9, r36_10 = r18_14(p18_0, r36_2, r36_3, true)
            if not r36_9 then
              break
            end
            r36_3 = r36_10 + 1
            r36_4 = r36_4 + 1
            local r36_11 = r18_66(r18_49(r36_10 + 1), p36_1 + 1)
            if r36_1 < r36_11 then
              r36_1 = r36_11
            end
          end
          r36_2 = "$" .. p36_0 .. "["
          r36_3, r36_4 = 1, 0
          while r36_4 < 8 and r36_1 < 2 do
            local r36_12, r36_13 = r18_14(p18_0, r36_2, r36_3, true)
            if not r36_12 then
              break
            end
            r36_3 = r36_13 + 1
            r36_4 = r36_4 + 1
            local r36_14 = r36_13
            local r36_15, r36_16 = true, 0
            while r18_15(p18_0, r36_14, r36_14) == "[" do
              local r36_17, r36_18 = r18_14(p18_0, "^%b[]", r36_14)
              r36_16 = r36_16 + 1
              if not r36_18 or r36_16 > 6 then
                r36_15 = false
                break
              end
              r36_14 = r36_18 + 1
            end
            if r36_15 and r18_15(p18_0, r36_14, r36_14) == "=" then
              local r36_19 = r18_15(p18_0, r36_14 + 1, r36_14 + 1)
              if r36_19 ~= "=" and r36_19 ~= ">" then
                local r36_20 = r18_66(r18_49(r36_14 + 1), p36_1 + 1)
                if r36_1 < r36_20 then
                  r36_1 = r36_20
                end
              end
            end
          end
          local r36_21 = r18_53[p36_0]
          if r36_21 and r36_1 < 2 and r36_1 < r18_66(r36_21, p36_1 + 1) then
            r36_1 = r18_66(r36_21, p36_1 + 1)
          end
          r18_64[p36_0] = r36_1
          return r36_1
        end
        return 0
      end
      return r36_0
    end

    function r18_66(p37_0, p37_1)
      if p37_0 == "$_server" then
        r18_58 = true
      end
      local r37_0 = r18_26(p37_0)
      local r37_1 = r18_27(r37_0)
      if r18_25(r37_1) then
        return 2
      end
      do
        local r37_2, r37_3 = 0, 0
        local r37_4 = r18_14(r37_1, "$", 1, true)
        local r37_5
        if r37_4 then
          local r37_6, r37_7, r37_8 = r18_18(r37_1, "%$([%a_][%w_]*)")
          r37_5 = r37_2
          for r37_9 in r37_6, r37_7, r37_8 do
            r37_3 = r37_3 + 1
            if r37_3 > 8 then
              r37_5 = r37_2
              break
            end
            local r37_10 = r18_67(r37_9, p37_1)
            if r37_10 == 2 then
              return 2
            end
            if r37_2 < r37_10 then
              r37_2 = r37_10
            end
          end
        else
          r37_5 = r37_2
        end
        local r37_11 = r37_5 == 1
        local r37_12
        if r37_11 or r37_1 == r37_0 then
          r37_12 = r37_11
        elseif r18_25(r37_0) then
          r37_12 = true
        else
          local r37_13 = 0
          local r37_14, r37_15, r37_16 = r18_18(r37_0, "%$([%a_][%w_]*)")
          r37_12 = r37_11
          for r37_17 in r37_14, r37_15, r37_16 do
            r37_13 = r37_13 + 1
            if r37_13 > 8 then
              break
            end
            if r18_67(r37_17, p37_1) >= 1 then
              r37_12 = true
              break
            end
          end
        end
        if r37_12 then
          local r37_18 = r18_14(p37_0, "chr(", 1, true)
          if r37_18 then
            return 2
          end
          return 1
        end
        return 0
      end
    end

    local function r18_68(p38_0)
      return r18_66(p38_0, 0) == 2
    end

    local r18_69 = r18_14
    r18_69 = r18_69(p18_0, "$_post", 1, true)
    if r18_69
      or r18_14(p18_0, "$_get", 1, true)
      or r18_14(p18_0, "$_request", 1, true)
      or r18_14(p18_0, "$_cookie", 1, true)
      or r18_14(p18_0, "$_files", 1, true)
      or r18_14(p18_0, "php://input", 1, true)
      or r18_24("getallheaders")
      or r18_24("apache_request_headers") then
      r18_13["Src.Request"] = true
    end
    r18_69 = r18_14
    if r18_69(p18_0, "%$_server%[%$") then
      r18_13["Src.ServerDynKey"] = true
    end
    if r18_14(p18_0, "\001!?[hH][tT][tT][pP]_") then
      local r18_70 = {
        http_host = true, http_user_agent = true, http_connection = true, http_cache_control = true,
        http_cookie = true, http_referer = true, http_content_type = true,
        http_content_length = true, http_authorization = true, http_x_requested_with = true,
        http_origin = true, http_pragma = true, http_upgrade_insecure_requests = true,
        http_upgrade = true, http_dnt = true, http_range = true, http_te = true, http_via = true,
        http_expect = true, http_keep_alive = true, http_proxy = true, http_client_ip = true,
        http_x_real_ip = true, http_x_cluster_client_ip = true, http_forwarded = true,
        http_forwarded_for = true, http_true_client_ip = true, http_x_http_method_override = true,
        http_x_original_url = true, http_x_rewrite_url = true, http_front_end_https = true,
        http_x_wap_profile = true, http_profile = true, http_x_csrf_token = true,
        http_x_xsrf_token = true
      }
      local r18_71 = {
        "http_x_forwarded", "http_sec_", "http_cf_", "http_if_", "http_accept", "http_x_wp_",
        "http_x_wc_", "http_x_hub_", "http_x_github_", "http_stripe_"
      }
      local r18_72 = 0
      r18_6, r18_7, r18_8 = r18_18(p18_0, "\001!?([hH][tT][tT][pP]_[%w_]+)\002")
      for r18_73 in r18_6, r18_7, r18_8 do
        r18_72 = r18_72 + 1
        if r18_72 > 60 then
          break
        end
        local r18_74 = r18_16
        r18_74 = r18_74(r18_73)
        local r18_75 = r18_70[r18_74]
        local r18_76
        if r18_75 then
          r18_76 = r18_75
        else
          local r18_77 = #r18_71
          r18_76 = r18_75
          for r18_78 = 1, r18_77 do
            local r18_79, r18_80 = r18_71[r18_78], r18_15
            r18_80 = r18_80(r18_74, 1, #r18_79)
            if r18_80 == r18_79 then
              r18_76 = true
              break
            end
          end
        end
        if not r18_76 then
          r18_13["Gate.CustomHeader"] = true
          break
        end
      end
    end
    local r18_81, r18_82 = r18_14(p18_0, "function_exists($", 1, true)
    if r18_82 and r18_14(p18_0, "function_exists($", r18_82 + 1, true) then
      r18_13["Indirect.FuncProbe"] = true
    end
    local r18_83, r18_84 = false, false

    local function r18_85(p39_0)
      r18_83 = true
      if not r18_84 and r18_68(p39_0) then
        r18_84 = true
      end
    end

    local r18_86 = r18_23
    r18_86("eval", 40, r18_85)
    r18_86 = r18_23
    r18_86("create_function", 10, r18_85)
    r18_86 = r18_23
    r18_86("assert", 20,
      function(p40_0)
        local r40_0 = r18_19(p40_0, "^%$([%a_][%w_]*)$")
        if r40_0 and r18_67(r40_0, 0) == 2 or r18_14(p40_0, "^%$_%a+%b[]$") then
          r18_83 = true
          r18_84 = true
        end
      end)
    local r18_87, r18_88 = false, false

    local function r18_89(p41_0)
      r18_87 = true
      if not r18_88 and r18_68(p41_0) then
        r18_88 = true
      end
    end

    local r18_90 = {
      "system", "exec", "shell_exec", "passthru", "popen", "proc_open", "pcntl_exec"
    }
    for r18_91 = 1, #r18_90 do
      local r18_92 = r18_23
      r18_92(r18_90[r18_91], 20, r18_89)
    end
    local r18_93 = {}
    local r18_94, r18_95 = false, false

    local function r18_96(p42_0)
      local r42_0 = 0
      for r42_1, r42_2 in r18_18(p18_0, p42_0) do
        r42_0 = r42_0 + 1
        if r42_0 > 30 then
          break
        end
        local r42_3 = not (r42_1 > 1) and "" or r18_15(p18_0, r42_1 - 1, r42_1 - 1)
        if not r18_14(r42_3, "[%w_%$>:\\]") then
          r18_94 = true
          r18_93[r42_2] = true
          if not r18_95 and (r18_22[r42_2] or r18_67(r42_2, 0) == 2) then
            r18_95 = true
          end
        end
      end
    end

    local r18_97 = r18_14
    r18_97 = r18_97(p18_0, "include", 1, true)
    if r18_97 then
      r18_96("()include[_once]*%(?%$([%a_][%w_]*)")
      local r18_98 = r18_96
      r18_98("()include[_once]*%(?\001[^\002]*\002%.%$([%a_][%w_]*)")
    end
    r18_97 = r18_14
    r18_97 = r18_97(p18_0, "require", 1, true)
    if r18_97 then
      r18_96("()require[_once]*%(?%$([%a_][%w_]*)")
      local r18_99 = r18_96
      r18_99("()require[_once]*%(?\001[^\002]*\002%.%$([%a_][%w_]*)")
    end
    local r18_100, r18_101 = false, false

    local function r18_102(p43_0)
      r18_100 = true
      if not r18_101 and r18_68(p43_0) then
        r18_101 = true
      end
    end

    local r18_103 = r18_23
    r18_103("fwrite", 20, r18_102)
    r18_103 = r18_23
    r18_103("fputs", 10, r18_102)
    r18_103 = r18_23
    r18_103("file_put_contents", 20, r18_102)
    local r18_104 = false
    if r18_94 then
      local r18_105 = r18_23
      r18_105("unlink", 20,
        function(p44_0)
          for r44_0 in r18_18(p44_0, "%$([%a_][%w_]*)") do
            if r18_93[r44_0] then
              r18_104 = true
            end
          end
        end)
    end
    local r18_106, r18_107, r18_108 = false, false, false
    r18_9, r18_10, r18_11, r18_12 = false, false, 1, 0
    while r18_12 < 60 do
      r18_12 = r18_12 + 1
      local r18_109, r18_110, r18_111 = r18_14(p18_0, "%$([%a_][%w_]*)%(", r18_11)
      if not r18_109 then
        break
      end
      r18_11 = r18_110 + 1
      local r18_112
      if r18_109 > 2 then
        r18_112 = r18_15(p18_0, r18_109 - 2, r18_109 - 1)
      elseif r18_109 > 1 then
        r18_112 = r18_15(p18_0, r18_109 - 1, r18_109 - 1)
      else
        r18_112 = ""
      end
      local r18_113 = r18_15
      r18_113 = r18_113(r18_112, -1)
      if r18_111 ~= "this"
        and r18_112 ~= "->"
        and r18_112 ~= "::"
        and r18_113 ~= "$"
        and r18_113 ~= "\\" then
        r18_9 = true
        local r18_114, r18_115 = r18_14(p18_0, "^%b()", r18_110)
        local r18_116 = nil
        if r18_114 then
          local r18_117 = r18_15
          r18_117 = r18_117(p18_0, r18_114 + 1, r18_115 - 1)
          r18_116 = r18_117
        else
          local r18_118 = r18_15
          r18_118 = r18_118(p18_0, r18_110 + 1, r18_110 + 240)
          r18_116 = r18_118
        end
        if #r18_116 > 1200 then
          r18_116 = r18_15(r18_116, 1, 1200)
        end
        if #r18_116 > 0 and r18_68(r18_116) then
          r18_10 = true
          local r18_119 = r18_47[r18_111]
          if r18_119 then
            r18_106 = true
            if r18_119 == "hidden" then
              r18_107 = true
            end
          end
          local r18_120 = r18_67
          r18_120 = r18_120(r18_111, 0)
          if r18_120 == 2 then
            r18_108 = true
          end
        end
      end
    end
    local r18_121, r18_122 = 1, 0
    while r18_122 < 20 do
      r18_122 = r18_122 + 1
      local r18_123, r18_124 = r18_14(p18_0, "%$_%a+%b[]%(", r18_121)
      if not r18_123 then
        break
      end
      r18_121 = r18_124 + 1
      local r18_125 = r18_19
      r18_125 = r18_125(p18_0, "^%$(_%a+)", r18_123)
      if r18_22[r18_125] then
        r18_108 = true
      end
    end

    local function r18_126(p45_0)
      local r45_0, r45_1 = r18_19(p45_0, "^([^,]*),(.*)$")
      if not (r45_0 and r18_68(r45_1)) then
        return
      end
      local r45_2, r45_3 = r18_19(r45_0, "^\001(!?)([%w_]+)\002$")
      if r45_3 and r18_20[r18_16(r45_3)] then
        r18_106 = true
        if r45_2 == "!" then
          r18_107 = true
        end
        return
      end
      local r45_4 = r18_19(r45_0, "^%$([%a_][%w_]*)$")
      if r45_4 then
        local r45_5 = r18_47[r45_4]
        if r45_5 then
          r18_106 = true
          if r45_5 == "hidden" then
            r18_107 = true
          end
        end
        if r18_67(r45_4, 0) == 2 then
          r18_108 = true
        end
      elseif r18_25(r45_0) then
        r18_108 = true
      end
    end

    local r18_127 = r18_23
    r18_127("call_user_func", 20, r18_126)
    r18_127 = r18_23
    r18_127("call_user_func_array", 20, r18_126)
    r18_127 = r18_23
    r18_127("array_map", 20, r18_126)
    if r18_58 then
      r18_13["Src.ServerAlias"] = true
    end
    if r18_83 then
      r18_13["Sink.Code"] = true
    end
    if r18_87 then
      r18_13["Sink.Cmd"] = true
    end
    if r18_94 then
      r18_13["Sink.DynInclude"] = true
    end
    if r18_84 then
      r18_13["Flow.SrcToCode"] = true
    end
    if r18_88 then
      r18_13["Flow.SrcToCmd"] = true
    end
    if r18_95 then
      r18_13["Flow.SrcToInclude"] = true
    end
    if r18_101 then
      r18_13["Flow.SrcToFile"] = true
    end
    if r18_100 and r18_104 then
      r18_13["Flow.StageIncludeUnlink"] = true
      if r18_101 then
        r18_13["Flow.SrcStagedInclude"] = true
      end
    end
    if r18_9 then
      r18_13["Indirect.VarCall"] = true
    end
    if r18_10 then
      r18_13["Flow.SrcToVarCall"] = true
    end
    if r18_106 then
      r18_13["Flow.SrcToVarSink"] = true
    end
    if r18_107 then
      r18_13["Flow.SrcToHiddenSink"] = true
    end
    if r18_108 then
      r18_13["Flow.SrcCallee"] = true
    end
    return r18_13
  end
  return r18_13
end

function WsPhpExtract(p46_0, p46_1)
  if type(p46_0) == "string" then
    local r46_0, r46_1 = nil, nil
    local r46_2, r46_3 = string.gsub(p46_0, "[\"'/#?<]", "")
    if r46_3 <= 400 then
      r46_0, r46_1 = WsPhpSkeleton(p46_0, p46_1), false
    else
      r46_0, r46_1 = WsPhpSkeletonFast(p46_0, p46_1)
    end
    if #r46_0 < 6 then
      return {}
    end
    return WsPhpAnalyze(r46_0, r46_1)
  end
  return {}
end
