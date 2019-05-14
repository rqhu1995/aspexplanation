package com.seu.hrqnanjing.ASPParser;

import com.seu.hrqnanjing.ExplanationGraph.ExplanationSpace;
import com.seu.hrqnanjing.ExplanationGraph.LiteralNode;
import com.seu.hrqnanjing.ExplanationGraph.RuleNode;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 * @author bobhu
 * 2018/12/19
 * function: single rule head/body/posBody/negBody extraction
 */
public class ASPRuleExtractor extends LPMLNBaseVisitor {

    private ASPRule ruleForParse = new ASPRule();

    //访问头部
    @Override
    public Object visitHead(LPMLNParser.HeadContext ctx) {
        List<LPMLNParser.LiteralContext> heads = ctx.literal();
        for (LPMLNParser.LiteralContext ctxs: heads) {
            String head = ctxs.getText();
            int idx = literalMapSet(head);
            ruleForParse.setHead(idx);
        }
        return super.visitHead(ctx);
    }


    public int literalMapSet(String literal) {
        int literalIdx;
        if (ruleForParse.getLiteralMap().containsKey(literal)) {
            literalIdx = ruleForParse.getLiteralMap().get(literal);
        } else {
            ruleForParse.getLiteralMap().put(literal, ruleForParse.getLiteralMap().size());
            ruleForParse.getLiteralReverseMap().put(ruleForParse.getLiteralMap().size()-1, literal);
            literalIdx = ruleForParse.getLiteralMap().size() - 1;
        }

        return literalIdx;
    }


    @Override
    public Object visitAtom(LPMLNParser.AtomContext ctx) {
        return super.visitAtom(ctx);
    }

    @Override
    public Object visitExtended_literal(LPMLNParser.Extended_literalContext ctx) {
        int litIdx;

        // 下方是正原子(extended不是pos就是neg）
        if(ctx.literal()!=null) {
            litIdx = literalMapSet(ctx.literal().getText());
            ruleForParse.setPosbody(litIdx);
        }else{
            litIdx = literalMapSet(ctx.default_literal().literal().getText());
            ruleForParse.setNegbody(litIdx);
        }
        return super.visitExtended_literal(ctx);
    }

    @Override
    public Object visitLiteral(LPMLNParser.LiteralContext ctx) {
        int literalIdx;
        literalIdx = literalMapSet(ctx.getText());
        return super.visitLiteral(ctx);
    }

    @Override
    public Object visitBody(LPMLNParser.BodyContext ctx) {
        return super.visitBody(ctx);
    }

    @Override
    public Object visitLpmln_rule(LPMLNParser.Lpmln_ruleContext ctx) {
        return super.visitLpmln_rule(ctx);
    }

    public ASPRule getRuleForParse() {
        ruleForParse.setRuleLiteralByPart();
        return ruleForParse;
    }

}
