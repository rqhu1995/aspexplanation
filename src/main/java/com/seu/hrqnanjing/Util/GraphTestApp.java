package com.seu.hrqnanjing.Util;

import guru.nidi.graphviz.attribute.Color;
import guru.nidi.graphviz.attribute.Records;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import guru.nidi.graphviz.model.MutableNode;

import java.io.File;
import java.io.IOException;

import static guru.nidi.graphviz.attribute.Records.rec;
import static guru.nidi.graphviz.engine.Format.PNG;
import static guru.nidi.graphviz.engine.Format.SVG;
import static guru.nidi.graphviz.model.Factory.*;

/**
 * @program: aspexplanation
 * @description: 测试Graphviz功能
 * @author: RunqiuHu
 * @create: 2019-05-14 17:14
 **/

public class GraphTestApp {
    public static void main(String[] args) throws IOException {
        MutableGraph g = mutGraph("example1").setDirected(true);
        MutableNode a = mutNode("a").attrs().add(Records.of(rec("f0", "1"), rec("f1", "2"),
                rec("f2", "3"),
                rec("f3", "4"),
                rec("f4", "5")));
        g.add(a);
        Graphviz.fromGraph(g).render(PNG).toFile(new File("example/png3.png"));


    }
}
