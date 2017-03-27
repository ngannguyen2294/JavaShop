/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.utils;

/**
 *
 * @author NGANNV
 */
public class HtmlUtils {

    public static String TableButton() {
        return "<button class=\"btn btn-minier btn-yellow dropdown-toggle\" data-toggle=\"dropdown\" data-position=\"auto\">\n"
                + "																		<i class=\"ace-icon fa fa-caret-down icon-only bigger-120\"></i>\n"
                + "																	</button>\n"
                + "\n"
                + "																	<ul class=\"dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close\">\n"
                + "																		<li>\n"
                + "																			<a href=\"#\" class=\"tooltip-info\" data-rel=\"tooltip\" title=\"View\">\n"
                + "																				<span class=\"blue\">\n"
                + "																					<i class=\"ace-icon fa fa-search-plus bigger-120\"></i>\n"
                + "																				</span>\n"
                + "																			</a>\n"
                + "																		</li>\n"
                + "\n"
                + "																		<li>\n"
                + "																			<a href=\"#\" class=\"tooltip-success\" data-rel=\"tooltip\" title=\"Edit\">\n"
                + "																				<span class=\"green\">\n"
                + "																					<i class=\"ace-icon fa fa-pencil-square-o bigger-120\"></i>\n"
                + "																				</span>\n"
                + "																			</a>\n"
                + "																		</li>\n"
                + "\n"
                + "																		<li>\n"
                + "																			<a href=\"#\" class=\"tooltip-error\" data-rel=\"tooltip\" title=\"Delete\">\n"
                + "																				<span class=\"red\">\n"
                + "																					<i class=\"ace-icon fa fa-trash-o bigger-120\"></i>\n"
                + "																				</span>\n"
                + "																			</a>\n"
                + "																		</li>\n"
                + "																	</ul>\n"
                + "																</div>\n";
    }
}
