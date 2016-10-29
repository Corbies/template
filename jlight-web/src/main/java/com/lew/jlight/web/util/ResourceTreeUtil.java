package com.lew.jlight.web.util;

import com.google.common.base.Strings;

import com.lew.jlight.core.util.BeanUtil;
import com.lew.jlight.web.entity.JSTree;
import com.lew.jlight.web.entity.Resources;
import com.lew.jlight.web.entity.SelectTree;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static java.lang.Integer.valueOf;


public abstract class ResourceTreeUtil {

    /*
     * select2下来组件数据对象
     */
    private List<SelectTree> selectTree = new ArrayList<>();
    /*
     * 生成select2下来组件数据时遍历的次数
     */
    private int selectCnt = 0;

    public static List<JSTree> generateJSTree(List<Map<String, Object>> resourceList) {
        List<JSTree> jstreeList = new ArrayList<>();

        for (Map<String, Object> resMap : resourceList) {
            String parentId = (String) resMap.get("parentId");
            String isSelectd = (String) resMap.get("selectedId");

            JSTree jstree = new JSTree();
            jstree.setId(resMap.get("resId").toString());
            jstree.setParent(BigInteger.ZERO.toString().equals(parentId) ? "#" : resMap.get("parentId").toString());
            jstree.setText(resMap.get("name").toString());
            jstree.setIcon(BeanUtil.isEmpty(resMap.get("icon")) ? "fa fa-cog" : resMap.get("icon").toString());
            JSTree.State state = new JSTree().new State();
            state.setDisabled(false);
            state.setSelected(!Strings.isNullOrEmpty(isSelectd));
            state.setOpened(true);
            jstree.setState(state);
            jstreeList.add(jstree);
        }
        return jstreeList;
    }

    public List<SelectTree> getSelectTree(List<Resources> list, Integer parentId) {
        List<Resources> returnList = getChildResourceEntitys(list, parentId);
        recursionForSelect(returnList);
        return selectTree;
    }

    /**
     * 递归列表
     */
    private void recursionForSelect(List<Resources> list) {
        String str = "";
        for (int i = 0; i < selectCnt; i++) {
            str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        }
        for (Resources re : list) {
            if (null == re.getParentId()) {
                str = "";
                selectCnt = 0;
            }
            SelectTree se = new SelectTree();
            se.setId(re.getResId());
            se.setText(str + re.getName());
            se.setName(re.getName());
            selectTree.add(se);
//			if ( re.getChildren( ).size( ) > 0 ) {
//				selectCnt++;
//				recursionForSelect( re.getChildren( ) );
//			}
        }
    }


    public List<Resources> getChildResourceEntitys(List<Resources> list, Integer parentId) {
        List<Resources> returnList = new ArrayList<>();
        Iterator<Resources> iterator;
        for (iterator = list.iterator(); iterator.hasNext(); ) {
            Resources t = iterator.next();
            // 一、根据传入的某个父节点ID,遍历该父节点的所有子节点
            if (valueOf(t.getParentId()) == parentId) {
                recursionFn(list, t);
                returnList.add(t);
            }
        }
        return returnList;
    }

    /**
     * 递归列表
     */
    private void recursionFn(List<Resources> list, Resources t) {
        List<Resources> childList = getChildList(list, t);// 得到子节点列表
//		t.setChildren( childList );
        // 判断是否有子节点
        childList.stream().filter(tChild -> hasChild(list, tChild)).forEach(tChild -> {
            // 判断是否有子节点
            for (Resources n : childList) {
                recursionFn(list, n);
            }
        });
    }

    /**
     * 得到子节点列表
     */
    private List<Resources> getChildList(List<Resources> list, Resources t) {
        return list.stream().filter(n -> t.getType() != 2).filter(n -> Objects.equals(n.getParentId(), t.getResId())).collect(Collectors.toList());
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<Resources> list, Resources t) {
        return getChildList(list, t).size() > 0;
    }

}
