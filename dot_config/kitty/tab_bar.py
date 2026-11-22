from kitty.fast_data_types import get_boss
from kitty.tab_bar import draw_title, color_as_int, as_rgb

def draw_tab(
	draw_data: DrawData, screen: Screen, tab: TabBarData, before: int,
	max_tab_length: int, index: int, is_last: bool, extra_data: ExtraData
) -> int:
	"""
	Draw tabs stretched to fill the window width.
	Show '|' separator between inactive tabs.
	"""

	separator = '|'
	num_tabs = len(get_boss().active_tab_manager.tabs)

	width = (screen.columns - (num_tabs - 1) * len(separator)) // num_tabs
	if is_last:
		width = screen.columns - before

	start = screen.cursor.x
	# draw title to determine it's width
	# there can be custom title template, so len(tab.title) is not used
	draw_title(draw_data, screen, tab, index, min(width, max_tab_length))
	title_width = screen.cursor.x - start

	padding = max(0, width - title_width)
	left = padding // 2
	right = padding - left

	screen.cursor.x = start
	screen.draw(' ' * left)
	draw_title(draw_data, screen, tab, index, width - padding)
	screen.draw(' ' * right)

	if not is_last:
		# draw tab separator after tab
		screen.cursor.bold = False
		screen.cursor.italic = False
		if tab.is_active or extra_data.next_tab.is_active:
			# separators before and after the active tab are invisible (fg == bg)
			screen.cursor.fg = as_rgb(color_as_int(draw_data.inactive_bg))
		else:
			screen.cursor.fg = as_rgb(color_as_int(draw_data.inactive_fg))
		screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
		screen.draw(separator)

	return screen.cursor.x
