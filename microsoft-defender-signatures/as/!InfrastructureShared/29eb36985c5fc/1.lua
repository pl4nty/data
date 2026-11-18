-- Threat: !InfrastructureShared
-- Name: 29eb36985c5fc
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p1
end
if l_0_0 then
  local function l_0_1(l_1_0)
    local l_1_1 = {}
    
    local l_1_2 = {}
    local l_1_3 = false
    l_1_0 = l_1_0:gsub("<!%-%-(.-)%-%->", "")
    l_1_0 = l_1_0:gsub("<%?(.-)%?>", "")
    l_1_0:gsub("<([/!]?)([%a_][%w-:_]*)%s*(/?>?)([^<]*)", function(l_2_0, l_2_1, l_2_2, l_2_3)
      if #l_2_0 == 0 then
        local l_2_4 = {}
        if #l_2_2 == 0 then
          local l_2_5 = 0
          for l_2_6, l_2_7, l_2_8, l_2_9, l_2_10 in string.gmatch(l_2_3, "(([%a_][%w-:_]*)%s*=%s*(['\"])(.-)%3%s*(/?>?))") do
            l_2_5 = l_2_5 + #l_2_6
            l_2_4[l_2_7] = l_2_9
            if #l_2_10 ~= 0 then
              if l_2_10 == "/>" then
                l_2_3 = ""
              elseif l_2_10 == ">" then
                l_2_3 = l_2_3:sub(l_2_5 + 1)
              else
                error("invalid tag")
              end
              l_2_2 = l_2_10
            end
          end
        end
        table.insert(l_1_1, l_2_1)
        if not l_1_3 and l_2_1 == "Command" then
          l_1_3 = true
        end
        if l_1_3 and l_2_3 ~= "" then
          table.insert(l_1_2, l_2_3)
        end
        if not next(l_2_4) then
          l_2_4 = nil
        end
        if l_2_2:byte(1) == string.byte("/") then
          table.remove(l_1_1)
        end
      elseif l_2_0 == "/" then
        if l_1_1[#l_1_1] == l_2_1 then
          table.remove(l_1_1)
        else
          error("invalid XML: mismatch closing tag")
        end
        if l_1_3 and l_2_1 == "Command" then
          l_1_3 = false
        end
      elseif l_2_0 == "!" then
        error("unsupported tag type")
      else
        error("parsing error")
      end
    end)
    return l_1_2
  end
  
  local function l_0_2(l_3_0)
    local l_3_1 = {}
    for l_3_2 in string.gmatch(l_3_0, "http[s]?://[^\"%s]+") do
      table.insert(l_3_1, l_3_2)
    end
    return l_3_1
  end
  
  local l_0_3 = {}
  l_0_3.SIG_CONTEXT = "BM"
  l_0_3.CONTENT_SOURCE = "SUSAPD-A"
  l_0_3.PROCESS_CONTEXT = "powershell.exe"
  l_0_3.FILELESS = "true"
  l_0_3.CMDLINE_URL = "true"
  local l_0_4 = l_0_1(l_0_0)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = l_0_2(l_0_6)
    for l_0_8, l_0_9 in ipairs(l_0_7) do
      if string.match(l_0_9, "^https?://") then
        local l_0_10 = SafeGetUrlReputation({l_0_9}, l_0_3, false, 3000)
        if l_0_10.urls[l_0_9] and l_0_10.urls[l_0_9].determination == 2 and l_0_10.urls[l_0_9].confidence >= 60 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
