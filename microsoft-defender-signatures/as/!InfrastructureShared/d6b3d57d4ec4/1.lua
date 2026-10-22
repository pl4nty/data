-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d6b3d57d4ec4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[5]
if not l_0_0 or not l_0_0.matched or type(l_0_0.utf8p1) ~= "string" or type(l_0_0.utf8p2) ~= "string" then
  return mp.CLEAN
end
local l_0_1 = (string.match)((l_0_0.utf8p1):lower(), "([^\\]+)$")
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)(l_0_1, "%.exe$", "")
local l_0_2 = (l_0_0.utf8p2):lower()
local l_0_3 = l_0_1
if l_0_1 == "cmd" or l_0_1 == "powershell" or l_0_1 == "pwsh" then
  local l_0_7 = nil
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Confused about usage of register: R5 in 'UnsetPending'

  -- DECOMPILER ERROR at PC87: Confused about usage of register: R5 in 'UnsetPending'

  if not (string.match)((string.match)(l_0_2, "%s%-c%s+[\'\"]?%s*([^%s\'\";&|<>]+)"), "([^\\]+)$") then
    l_0_3 = (string.gsub)((l_0_1 ~= "cmd" or not (string.match)(l_0_2, "%s%-command%s+[\'\"]?%s*([^%s\'\";&|<>]+)")) and not (string.match)(l_0_2, "%s%-c%s+[\'\"]?%s*([^%s\'\";&|<>]+)") or (string.match)(l_0_2, "%s%-c%s+[\'\"]?%s*([^%s\'\";&|<>]+)"), "%.exe$", "")
    local l_0_8 = nil
    local l_0_9 = containsall
    do
      local l_0_10 = l_0_2
      l_0_9 = l_0_9(l_0_10, {"system.net.sockets.tcpclient", "getstream", ".read(", ".write("})
      if l_0_9 then
        l_0_9 = contains
        l_0_10 = l_0_2
        l_0_9 = l_0_9(l_0_10, {"%f[%w]iex%f[%W]", "invoke%-expression", "scriptblock::create"}, false)
        if l_0_9 then
          l_0_9 = mp
          l_0_9 = l_0_9.INFECTED
          return l_0_9
        end
      end
      if l_0_3 == "whoami" or l_0_3 == "ipconfig" then
        return mp.INFECTED
      end
      local l_0_12 = nil
      local l_0_13 = contains
      do
        local l_0_14 = l_0_2
        l_0_13 = l_0_13(l_0_14, {"http://", "https://"})
        -- DECOMPILER ERROR at PC139: Unhandled construct in 'MakeBoolean' P1

        -- DECOMPILER ERROR at PC139: Unhandled construct in 'MakeBoolean' P1

        if l_0_13 and l_0_3 ~= "curl" and l_0_3 ~= "wget" and l_0_3 == "certutil" then
          l_0_14 = contains
          l_0_14 = l_0_14(l_0_2, "-urlcache")
          if l_0_14 then
            l_0_14 = mp
            l_0_14 = l_0_14.INFECTED
            return l_0_14
          end
        end
        if (l_0_12 or l_0_3 == "powershell" or l_0_3 == "pwsh") and l_0_13 then
          l_0_14 = contains
          l_0_14 = l_0_14(l_0_2, "downloadfile(")
          if not l_0_14 then
            l_0_14 = contains
            l_0_14 = l_0_14(l_0_2, "downloadstring(")
            if l_0_14 then
              l_0_14 = contains
              local l_0_15 = l_0_2
              l_0_14 = l_0_14(l_0_15, {"%f[%w]iex%f[%W]", "invoke%-expression"}, false)
            end
            if not l_0_14 then
              l_0_14 = contains
              l_0_15 = l_0_2
              local l_0_16 = {}
              -- DECOMPILER ERROR at PC183: No list found for R8 , SetList fails

              -- DECOMPILER ERROR at PC188: Overwrote pending register: R6 in 'AssignReg'

            end
          end
          -- DECOMPILER ERROR at PC194: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC195: Overwrote pending register: R6 in 'AssignReg'

          if l_0_14 and l_0_14 then
            return l_0_14
          end
        end
        -- DECOMPILER ERROR at PC197: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC198: Overwrote pending register: R6 in 'AssignReg'

        do return l_0_14 end
        -- WARNING: undefined locals caused missing assignments!
        -- DECOMPILER ERROR: 15 unprocessed JMP targets
      end
    end
  end
end

