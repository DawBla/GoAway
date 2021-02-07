local n,m

local GoAway = LibStub("AceAddon-3.0"):NewAddon("GoAway", "AceConsole-3.0")
local goAwayLDB = LibStub("LibDataBroker-1.1"):NewDataObject("GoAway!", {
  type = "data source",
  text = "GoAway",
  icon = "Interface\\Addons\\GoAway\\Assets\\icon",
  OnClick = function()
    if GetCVar("componentTexLoadLimit") == "0"
      then n=6 m=2
      else n=0 m=1
    end
    SetCVar("componentTexLoadLimit",n)
    SetCVar("graphicsTextureResolution",m)
  end,
  OnTooltipShow = function(Tip)
      if not Tip or not Tip.AddLine then
          return
      end
      Tip:AddLine("Go Away")
      Tip:AddLine("|cffffff00Left click:|r Toggle visibility of player models", 1, 1, 1)
  end,
})
local icon = LibStub("LibDBIcon-1.0")

function GoAway:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("GoAwayDB", { profile = { minimap = { hide = false, }, }, }) icon:Register("GoAway!", goAwayLDB, self.db.profile.minimap)
end
